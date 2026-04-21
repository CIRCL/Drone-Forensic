#!/usr/bin/env python3
"""Drone forensic → MISP Event generator.

Consumes any subset of FC dump, blackbox log, and ELRS config and produces a
MISP Event with the appropriate objects and cross-references. The encoder
functions in this module are also imported by the workshop notebook so both
entry points produce identical events.

Usage:
    drone_to_misp.py [--fc PATH] [--blackbox PATH] [--elrs PATH]
                     [--output event.json] [--push] [--config PATH]

At least one of --fc, --blackbox, --elrs is required.
"""

from __future__ import annotations

import argparse
import contextlib
import hashlib
import io
import json
import re
import sys
import tempfile
import yara
from html import escape
from pathlib import Path
from typing import Any

from pymisp import MISPEvent, MISPObject, PyMISP

REPO_ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(REPO_ROOT / "fc" / "src"))
sys.path.insert(0, str(REPO_ROOT / "blackbox" / "src"))
sys.path.insert(0, str(REPO_ROOT / "elrs" / "src"))

import inav_extract_flash as inav_extract    # noqa: E402
import inav_dump_config as inav_decode       # noqa: E402
import beta_extract_flash as beta_extract    # noqa: E402
import beta_dump_config as beta_decode       # noqa: E402
import bbox_decode                           # noqa: E402
import dump_elrs                             # noqa: E402

YARA_DIR = REPO_ROOT / "fc" / "yara"

FC_FAMILY_RULES = {
    "INAV": "drones_inav_firmwares.yara",
    "BETAFLIGHT": "drones_betaflight_firmwares.yara",
    "ARDUPILOT": "drones_ardupilot_firmwares.yara",
}


# --------------------------------------------------------------------------
# Extraction helpers — produce the intermediate JSON shape that the encoder
# consumes. CLI and notebook both call these.
# --------------------------------------------------------------------------


def _hashes(data: bytes) -> dict[str, Any]:
    return {
        "md5": hashlib.md5(data).hexdigest(),
        "sha256": hashlib.sha256(data).hexdigest(),
        "size": len(data),
    }


def _yara_scan(rules_path: Path, data: bytes) -> list[dict[str, Any]]:
    rules = yara.compile(filepath=str(rules_path))
    return [
        {"rule": m.rule, "meta": dict(m.meta) if m.meta else {}}
        for m in rules.match(data=data)
    ]


def detect_fc_family(data: bytes) -> str | None:
    matches = _yara_scan(YARA_DIR / "drones_operating.yara", data)
    for m in matches:
        family = m["meta"].get("operating_system")
        if family:
            return family
    return None


def detect_fc_target(data: bytes, family: str) -> dict[str, str] | None:
    rule_file = FC_FAMILY_RULES.get(family)
    if rule_file is None:
        return None
    for m in _yara_scan(YARA_DIR / rule_file, data):
        meta = m["meta"]
        target = meta.get("target")
        chipset = meta.get("chipset")
        if target and chipset and "SITL" not in target.upper():
            return {
                "target": target,
                "chipset": chipset,
                "build_macro": meta.get("build_macro", ""),
            }
    return None


def _chipset_to_key(chipset: str) -> str:
    return chipset.lower().replace("stm32", "").strip()


def extract_fc(dump_path: Path) -> dict[str, Any]:
    """Run the full FC pipeline: YARA detection + FLASH_CONFIG parsing."""
    data = dump_path.read_bytes()
    result: dict[str, Any] = {
        "file": {"path": str(dump_path), "filename": dump_path.name, **_hashes(data)},
    }
    family = detect_fc_family(data)
    target_info = detect_fc_target(data, family) if family else None
    result["firmware"] = {"family": family, **(target_info or {})}

    if family == "INAV" and target_info:
        _parse_inav(data, target_info, result)
    elif family == "BETAFLIGHT" and target_info:
        _parse_betaflight(data, target_info, result)

    return result


def _parse_inav(data: bytes, target_info: dict[str, str], result: dict[str, Any]) -> None:
    try:
        _, region = inav_extract.resolve_hardware(_chipset_to_key(target_info["chipset"]))
    except KeyError as exc:
        result["parse_error"] = f"INAV region lookup failed: {exc}"
        return
    offset = region.origin - 0x08000000
    if offset + region.length > len(data):
        result["parse_error"] = "INAV FLASH_CONFIG region exceeds dump size"
        return
    flash_cfg = data[offset:offset + region.length]
    try:
        config = inav_decode.parse_config_dump(flash_cfg)
    except ValueError as exc:
        result["parse_error"] = f"INAV config parse failed: {exc}"
        return

    pg_map = inav_decode.load_pgn_map(inav_decode.DEFAULT_PG_HEADER)
    (
        system_config_pgn,
        waypoint_storage_pgn,
        max_name_length,
        nav_wp_flag_last,
        nav_wp_action_rth,
        nav_wp_action_names,
    ) = inav_decode.load_runtime_constants(
        inav_decode.DEFAULT_PG_HEADER,
        inav_decode.DEFAULT_CONFIG_HEADER,
        inav_decode.DEFAULT_NAVIGATION_HEADER,
    )
    _, craft, pilot, waypoints = inav_decode.generate_report(
        config, pg_map,
        result["file"]["md5"], result["file"]["sha256"],
        system_config_pgn, waypoint_storage_pgn, max_name_length,
        nav_wp_flag_last, nav_wp_action_rth, nav_wp_action_names,
    )
    result["craft_name"] = craft
    result["pilot_name"] = pilot
    result["waypoints"] = [inav_decode.serialize_waypoint(w) for w in waypoints]
    if waypoints:
        result["gpx_text"] = _build_waypoint_gpx(waypoints, craft, pilot)


def _parse_betaflight(data: bytes, target_info: dict[str, str], result: dict[str, Any]) -> None:
    try:
        _, layout = beta_extract.find_layout(target_info["chipset"])
    except ValueError as exc:
        result["parse_error"] = f"Betaflight layout lookup failed: {exc}"
        return
    if layout.offset + layout.config_size > len(data):
        result["parse_error"] = "Betaflight FLASH_CONFIG region exceeds dump size"
        return
    flash_cfg = data[layout.offset:layout.offset + layout.config_size]
    try:
        config = beta_decode.parse_config_dump(flash_cfg)
    except ValueError as exc:
        result["parse_error"] = f"Betaflight config parse failed: {exc}"
        return

    pilot_config_pgn, max_name_length = beta_decode.load_runtime_constants(
        beta_decode.DEFAULT_PG_HEADER, beta_decode.DEFAULT_PILOT_HEADER,
    )
    pg_map = beta_decode.load_pgn_map(beta_decode.DEFAULT_PG_HEADER)
    _, craft, pilot = beta_decode.generate_report(
        config, pg_map,
        result["file"]["md5"], result["file"]["sha256"],
        pilot_config_pgn, max_name_length,
    )
    result["craft_name"] = craft
    result["pilot_name"] = pilot
    result["waypoints"] = []


def _build_waypoint_gpx(waypoints, craft: str | None, pilot: str | None) -> str:
    out = io.StringIO()
    title_parts = ["INAV Mission"]
    if craft:
        title_parts.append(craft)
    if pilot:
        title_parts.append(pilot)
    track_name = craft or "Mission Track"
    out.write('<?xml version="1.0" encoding="UTF-8"?>\n')
    out.write(
        '<gpx version="1.1" creator="drone_to_misp" '
        'xmlns="http://www.topografix.com/GPX/1/1">\n'
    )
    out.write(f"  <metadata><name>{escape(' - '.join(title_parts))}</name></metadata>\n")
    out.write(f"  <trk><name>{escape(track_name)}</name><trkseg>\n")
    for wp in waypoints:
        if wp.lat == 0 and wp.lon == 0:
            continue
        out.write(
            f'    <trkpt lat="{wp.lat / 1e7:.7f}" lon="{wp.lon / 1e7:.7f}">'
            f'<ele>{wp.alt / 100.0:.2f}</ele>'
            f'<name>WP{wp.index:02d} {escape(wp.action_name)}</name></trkpt>\n'
        )
    out.write("  </trkseg></trk>\n</gpx>\n")
    return out.getvalue()


def extract_blackbox(path: Path) -> dict[str, Any]:
    data = path.read_bytes()
    result: dict[str, Any] = {
        "file": {"path": str(path), "filename": path.name, **_hashes(data)},
        "logs": [],
    }

    with tempfile.TemporaryDirectory() as tmpdir:
        tmp_input = Path(tmpdir) / path.name
        tmp_input.write_bytes(data)
        stdout_buf = io.StringIO()
        with contextlib.redirect_stdout(stdout_buf):
            try:
                bbox_decode.decode_file(
                    tmp_input, json_output=True, only_gpx=True, info_output=True,
                )
            except SystemExit as exc:
                result["parse_error"] = str(exc)
                return result
        try:
            meta = json.loads(stdout_buf.getvalue())
        except json.JSONDecodeError:
            meta = {}
        result["logs"] = meta.get("logs", [])

        gpx_by_index: dict[int, dict[str, Any]] = {}
        for gpx_path in sorted(Path(tmpdir).glob("*.gps.gpx")):
            content = gpx_path.read_text()
            if "<trkpt " not in content:
                continue
            match = re.search(r"\.(\d+)\.gps\.gpx$", gpx_path.name)
            if not match:
                continue
            idx = int(match.group(1))
            blob = content.encode("utf-8")
            gpx_by_index[idx] = {
                "gpx_text": content,
                "gpx_filename": gpx_path.name,
                "gpx_hashes": {
                    "md5": hashlib.md5(blob).hexdigest(),
                    "sha256": hashlib.sha256(blob).hexdigest(),
                    "size": len(blob),
                },
            }
        result["gpx_by_index"] = gpx_by_index

    return result


_IHEX_DIGITS = frozenset(b"0123456789abcdefABCDEF")


def _is_intel_hex(data: bytes) -> bool:
    """Sniff Intel HEX: starts with ':' followed by 8 ASCII hex digits."""
    stripped = data.lstrip()
    if len(stripped) < 11 or stripped[0:1] != b":":
        return False
    return all(b in _IHEX_DIGITS for b in stripped[1:9])


def _ihex_to_bin(data: bytes) -> bytes:
    """Decode Intel HEX to binary, matching `objcopy -I ihex -O binary`.

    Handles record types 00 (data), 01 (EOF), 02 (extended segment address),
    and 04 (extended linear address). Start-address records (03, 05) are
    ignored — they have no effect on -O binary output. Gaps are filled with
    0xFF (objcopy's default).
    """
    payload: dict[int, int] = {}
    base = 0
    saw_eof = False

    for line in data.splitlines():
        line = line.strip()
        if not line:
            continue
        if line[0:1] != b":":
            raise ValueError(f"Intel HEX record does not start with ':': {line[:16]!r}")
        try:
            raw = bytes.fromhex(line[1:].decode("ascii"))
        except (UnicodeDecodeError, ValueError) as exc:
            raise ValueError(f"Malformed Intel HEX record: {line[:16]!r}") from exc
        if len(raw) < 5:
            raise ValueError(f"Intel HEX record too short: {line!r}")

        length, addr_hi, addr_lo, rtype = raw[0], raw[1], raw[2], raw[3]
        addr = (addr_hi << 8) | addr_lo
        record_data = raw[4:4 + length]
        checksum = raw[4 + length]
        if len(record_data) != length:
            raise ValueError(f"Intel HEX length mismatch: {line!r}")
        if (sum(raw[:4 + length]) + checksum) & 0xFF != 0:
            raise ValueError(f"Intel HEX checksum error: {line!r}")

        if rtype == 0x00:
            absolute = base + addr
            for i, byte in enumerate(record_data):
                payload[absolute + i] = byte
        elif rtype == 0x01:
            saw_eof = True
            break
        elif rtype == 0x02:
            if length != 2:
                raise ValueError(f"Intel HEX type 02 length must be 2: {line!r}")
            base = ((record_data[0] << 8) | record_data[1]) << 4
        elif rtype == 0x04:
            if length != 2:
                raise ValueError(f"Intel HEX type 04 length must be 2: {line!r}")
            base = ((record_data[0] << 8) | record_data[1]) << 16
        # rtype 0x03 / 0x05: start-address records — ignored for -O binary

    if not payload:
        return b""
    if not saw_eof:
        raise ValueError("Intel HEX missing EOF record")

    lo, hi = min(payload), max(payload)
    return bytes(payload.get(addr, 0xFF) for addr in range(lo, hi + 1))


def extract_elrs(path: Path) -> dict[str, Any]:
    """Extract embedded JSON configs from an ELRS RX dump.

    Intel HEX inputs are auto-converted to binary before scanning (same
    result as `objcopy -I ihex -O binary`). The file hash still reflects
    the on-disk artifact, since that's the fingerprint the analyst was
    handed.
    """
    data = path.read_bytes()
    payload = data
    fmt = "raw"
    if _is_intel_hex(data):
        fmt = "Intel hex"
        try:
            payload = _ihex_to_bin(data)
        except ValueError:
            payload = data  # malformed HEX — scan the raw bytes anyway
            fmt = "raw"
    entries = dump_elrs.extract_json_objects(payload)
    collected = []
    for e in entries:
        collected.append({
            "uid": e.get("uid"),
            "wifi_ssid": e.get("wifi_ssid"),
            "wifi_password": e.get("wifi_password"),
        })
    return {
        "file": {"path": str(path), "filename": path.name, **_hashes(data)},
        "format": fmt,
        "entries": collected,
    }


def run_extraction(fc: Path | None, blackbox: Path | None,
                   elrs: Path | None) -> dict[str, Any]:
    extracted: dict[str, Any] = {}
    if fc:
        print(f"[FC] extracting {fc.name} ...", file=sys.stderr)
        extracted["fc"] = extract_fc(fc)
    if blackbox:
        print(f"[blackbox] extracting {blackbox.name} ...", file=sys.stderr)
        extracted["blackbox"] = extract_blackbox(blackbox)
    if elrs:
        print(f"[ELRS] extracting {elrs.name} ...", file=sys.stderr)
        extracted["elrs"] = extract_elrs(elrs)
    return extracted


# --------------------------------------------------------------------------
# MISP encoder — builds the MISP Event from the intermediate JSON shape
# --------------------------------------------------------------------------


def _add_file_attachment(obj: MISPObject, filename: str, data: bytes) -> None:
    obj.add_attribute("attachment", value=filename, data=io.BytesIO(data))


def _build_file_object(file_info: dict[str, Any]) -> MISPObject:
    obj = MISPObject("file")
    obj.add_attribute("filename", value=file_info["filename"])
    obj.add_attribute("md5", value=file_info["md5"])
    obj.add_attribute("sha256", value=file_info["sha256"])
    obj.add_attribute("size-in-bytes", value=file_info["size"])
    _add_file_attachment(obj, file_info["filename"], Path(file_info["path"]).read_bytes())
    return obj


def _pick_primary_log(logs: list[dict[str, Any]]) -> dict[str, Any] | None:
    for entry in logs:
        if entry.get("has_gps"):
            return entry
    return logs[0] if logs else None


def _merge_craft_info(fc_data: dict[str, Any] | None,
                      blackbox_data: dict[str, Any] | None) -> dict[str, Any]:
    craft_name: str | None = None
    pilot_name: str | None = None
    firmware_version: str | None = None

    if fc_data:
        craft_name = fc_data.get("craft_name")
        pilot_name = fc_data.get("pilot_name")

    if blackbox_data:
        primary = _pick_primary_log(blackbox_data.get("logs", []))
        if primary:
            if not craft_name:
                craft_name = primary.get("craft_name")
            if not firmware_version:
                firmware_version = primary.get("firmware_revision")
    return {
        "craft_name": craft_name,
        "pilot_name": pilot_name,
        "firmware_version": firmware_version,
    }


def _gpx_bbox(gpx_text: str) -> dict[str, float]:
    pts = re.findall(r'<trkpt[^>]*lat="([^"]+)"[^>]*lon="([^"]+)"', gpx_text)
    if not pts:
        return {}
    lats = [float(p[0]) for p in pts]
    lons = [float(p[1]) for p in pts]
    return {
        "min_lat": min(lats), "max_lat": max(lats),
        "min_lon": min(lons), "max_lon": max(lons),
        "point_count": len(pts),
    }


def _gpx_time_bounds(gpx_text: str) -> tuple[str, str] | None:
    times = re.findall(r"<time>([^<]+)</time>", gpx_text)
    if not times:
        return None
    return times[0], times[-1]


def _build_gpx_object(gpx_text: str, filename: str, hashes: dict[str, Any],
                      waypoint_count: int) -> MISPObject:
    obj = MISPObject("gpx")
    gpx_bytes = gpx_text.encode("utf-8")
    obj.add_attribute("filename", value=filename)
    obj.add_attribute("md5", value=hashes["md5"])
    obj.add_attribute("sha256", value=hashes["sha256"])
    obj.add_attribute("size-in-bytes", value=hashes["size"])
    obj.add_attribute("gpx-version", value="1.1")
    obj.add_attribute("mime-type", value="application/gpx+xml")
    obj.add_attribute("attachment", value=filename, data=io.BytesIO(gpx_bytes))
    obj.add_attribute("creator", value="drone_to_misp")

    bbox = _gpx_bbox(gpx_text)
    if bbox:
        obj.add_attribute("min-latitude", value=bbox["min_lat"])
        obj.add_attribute("max-latitude", value=bbox["max_lat"])
        obj.add_attribute("min-longitude", value=bbox["min_lon"])
        obj.add_attribute("max-longitude", value=bbox["max_lon"])
        obj.add_attribute("point-count", value=bbox["point_count"])
    if waypoint_count:
        obj.add_attribute("waypoint-count", value=waypoint_count)
    bounds = _gpx_time_bounds(gpx_text)
    if bounds:
        obj.first_seen, obj.last_seen = bounds
    return obj


def _build_uav_object(craft_info: dict[str, Any],
                      fc_data: dict[str, Any] | None) -> MISPObject | None:
    fw = (fc_data or {}).get("firmware", {})
    model = fw.get("target") or craft_info.get("craft_name")
    if not model:
        return None
    obj = MISPObject("uav")
    obj.add_attribute("model", value=model)
    if craft_info.get("craft_name"):
        obj.add_attribute("craftname", value=craft_info["craft_name"])
    if craft_info.get("pilot_name"):
        obj.add_attribute("operator", value=craft_info["pilot_name"])
    if craft_info.get("firmware_version"):
        obj.add_attribute("firmware-version", value=craft_info["firmware_version"])
    if fw.get("family"):
        obj.add_attribute("variant", value=fw["family"])
    if fw.get("chipset"):
        obj.add_attribute("chipset", value=fw["chipset"])
    return obj


def _build_iot_firmware(file_info: dict[str, Any], *,
                        fmt: str = "raw",
                        version: str | None = None) -> MISPObject:
    obj = MISPObject("iot-firmware")
    obj.add_attribute("filename", value=file_info["filename"])
    obj.add_attribute("md5", value=file_info["md5"])
    obj.add_attribute("sha256", value=file_info["sha256"])
    obj.add_attribute("size-in-bytes", value=file_info["size"])
    obj.add_attribute("format", value=fmt)
    if version:
        obj.add_attribute("version", value=version)
    obj.add_attribute(
        "firmware", value=file_info["filename"],
        data=io.BytesIO(Path(file_info["path"]).read_bytes()),
    )
    return obj


def _build_geolocations(
        blackbox_data: dict[str, Any]) -> list[tuple[int, str, MISPObject]]:
    out: list[tuple[int, str, MISPObject]] = []
    for log in blackbox_data.get("logs", []):
        if not log.get("has_gps"):
            continue
        idx = log["log_index"]
        for coord_key, label, kind in (
            ("arming_coord",   "arming position",    "arming"),
            ("disarmed_coord", "disarming position", "disarming"),
        ):
            coord = log.get(coord_key)
            if not coord:
                continue
            obj = MISPObject("geolocation")
            obj.add_attribute("latitude", value=float(coord["lat"]))
            obj.add_attribute("longitude", value=float(coord["lon"]))
            obj.add_attribute("text", value=label)
            out.append((idx, kind, obj))
    return out


def _build_elrs_objects(
        elrs_data: dict[str, Any]) -> tuple[MISPObject | None, MISPObject | None]:
    wifi_obj: MISPObject | None = None
    rc_obj: MISPObject | None = None
    for entry in elrs_data.get("entries", []):
        if wifi_obj is None and (entry.get("wifi_ssid") or entry.get("wifi_password")):
            wifi_obj = MISPObject("wifi-connection")
            if entry.get("wifi_ssid"):
                wifi_obj.add_attribute("ssid", value=entry["wifi_ssid"])
            if entry.get("wifi_password"):
                wifi_obj.add_attribute("password", value=entry["wifi_password"])
        if rc_obj is None and entry.get("uid"):
            uid_bytes = entry["uid"]
            uid_str = "-".join(f"{b:02X}" for b in uid_bytes)
            rc_obj = MISPObject("remote-controller")
            rc_obj.add_attribute("model", value="ExpressLRS receiver")
            rc_obj.add_attribute("remote-controller-id", value=uid_str)
    return wifi_obj, rc_obj


def build_event(extracted: dict[str, Any],
                event_info: str | None = None) -> MISPEvent:
    event = MISPEvent()
    event.info = event_info or "Drone forensic analysis"
    event.distribution = 0  # Your Organisation Only

    fc_data = extracted.get("fc")
    blackbox_data = extracted.get("blackbox")
    elrs_data = extracted.get("elrs")

    craft_info = _merge_craft_info(fc_data, blackbox_data)
    uav = _build_uav_object(craft_info, fc_data)
    if uav is not None:
        event.add_object(uav)

    iot_firmware = None
    if fc_data:
        iot_firmware = _build_iot_firmware(
            fc_data["file"],
            fmt="raw",
            version=fc_data.get("firmware", {}).get("build_macro") or None,
        )
        event.add_object(iot_firmware)

    fc_gpx = None
    if fc_data and fc_data.get("gpx_text"):
        gpx_bytes = fc_data["gpx_text"].encode("utf-8")
        fc_gpx = _build_gpx_object(
            fc_data["gpx_text"],
            filename=f"{Path(fc_data['file']['filename']).stem}_waypoints.gpx",
            hashes={
                "md5": hashlib.md5(gpx_bytes).hexdigest(),
                "sha256": hashlib.sha256(gpx_bytes).hexdigest(),
                "size": len(gpx_bytes),
            },
            waypoint_count=len(fc_data.get("waypoints", [])),
        )
        event.add_object(fc_gpx)

    blackbox_file = None
    blackbox_gpx_by_index: dict[int, MISPObject] = {}
    geolocation_objs: list[tuple[int, str, MISPObject]] = []
    if blackbox_data:
        blackbox_file = _build_file_object(blackbox_data["file"])
        event.add_object(blackbox_file)
        for idx, gpx_info in blackbox_data.get("gpx_by_index", {}).items():
            gpx_obj = _build_gpx_object(
                gpx_info["gpx_text"],
                filename=gpx_info["gpx_filename"],
                hashes=gpx_info["gpx_hashes"],
                waypoint_count=0,
            )
            event.add_object(gpx_obj)
            blackbox_gpx_by_index[idx] = gpx_obj
        geolocation_objs = _build_geolocations(blackbox_data)
        for _, _, geo in geolocation_objs:
            event.add_object(geo)

    elrs_firmware = wifi_obj = rc_obj = None
    if elrs_data:
        elrs_firmware = _build_iot_firmware(
            elrs_data["file"], fmt=elrs_data.get("format", "raw"),
        )
        event.add_object(elrs_firmware)
        wifi_obj, rc_obj = _build_elrs_objects(elrs_data)
        if wifi_obj is not None:
            event.add_object(wifi_obj)
        if rc_obj is not None:
            event.add_object(rc_obj)

    _add_references(
        uav=uav, iot_firmware=iot_firmware,
        fc_gpx=fc_gpx, blackbox_file=blackbox_file,
        blackbox_gpx_by_index=blackbox_gpx_by_index,
        geolocation_objs=geolocation_objs, elrs_firmware=elrs_firmware,
        wifi_obj=wifi_obj, rc_obj=rc_obj,
    )
    return event


def _add_references(
        *, uav, iot_firmware, fc_gpx,
        blackbox_file, blackbox_gpx_by_index,
        geolocation_objs, elrs_firmware, wifi_obj, rc_obj):
    if uav and iot_firmware:
        uav.add_reference(iot_firmware.uuid, "contains")
    if uav and fc_gpx:
        uav.add_reference(fc_gpx.uuid, "plans")
    if uav:
        for bb_gpx in blackbox_gpx_by_index.values():
            uav.add_reference(bb_gpx.uuid, "navigated")
    for idx, kind, geo in geolocation_objs:
        target = blackbox_gpx_by_index.get(idx)
        if target is None:
            continue
        relation = "starts" if kind == "arming" else "ends"
        geo.add_reference(target.uuid, relation)
    if uav and blackbox_file:
        uav.add_reference(blackbox_file.uuid, "contains")
    if uav and elrs_firmware:
        uav.add_reference(elrs_firmware.uuid, "contains")
    if uav and wifi_obj:
        uav.add_reference(wifi_obj.uuid, "connects-to")
    if rc_obj and uav:
        rc_obj.add_reference(uav.uuid, "controls")


# --------------------------------------------------------------------------
# CLI
# --------------------------------------------------------------------------


def _parse_args(argv: list[str] | None = None) -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Generate a MISP Event from drone forensic artifacts.",
    )
    parser.add_argument("--fc", type=Path, help="Path to the Flight Controller ROM dump")
    parser.add_argument("--blackbox", type=Path, help="Path to the Blackbox log dump")
    parser.add_argument("--elrs", type=Path, help="Path to the ELRS config dump")
    parser.add_argument(
        "-o", "--output", type=Path, default=Path("event.json"),
        help="Where to write the MISP Event JSON (default: event.json)",
    )
    parser.add_argument("--push", action="store_true",
                        help="Push to MISP using the config file (see --config)")
    parser.add_argument(
        "--config", type=Path, default=Path(__file__).resolve().parent / "misp_config.json",
        help="Path to the MISP config JSON file (default: misp/misp_config.json)",
    )
    parser.add_argument("--event-info", help="Optional event info string")
    args = parser.parse_args(argv)
    if not (args.fc or args.blackbox or args.elrs):
        parser.error("at least one of --fc, --blackbox, --elrs is required")
    for attr in ("fc", "blackbox", "elrs"):
        path = getattr(args, attr)
        if path is not None and not path.is_file():
            parser.error(f"--{attr}: file not found: {path}")
    return args


def _load_misp_config(path: Path) -> dict[str, Any]:
    if not path.is_file():
        raise SystemExit(
            f"MISP config file not found: {path}\n"
            f"Copy {path.with_suffix('.json.example').name} "
            f"to {path.name} and fill in your credentials."
        )
    try:
        config = json.loads(path.read_text(encoding="utf-8"))
    except json.JSONDecodeError as exc:
        raise SystemExit(f"Invalid JSON in {path}: {exc}")
    missing = [k for k in ("url", "key") if not config.get(k)]
    if missing:
        raise SystemExit(f"Missing required keys in {path}: {', '.join(missing)}")
    return config


def _push_event(event: MISPEvent, config_path: Path) -> None:
    config = _load_misp_config(config_path)
    client = PyMISP(config["url"], config["key"], ssl=config.get("verify_ssl", True))
    response = client.add_event(event)
    print(json.dumps(response, indent=2) if isinstance(response, dict) else response)


def main(argv: list[str] | None = None) -> int:
    args = _parse_args(argv)
    extracted = run_extraction(args.fc, args.blackbox, args.elrs)
    event = build_event(extracted, event_info=args.event_info)
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(event.to_json(indent=2), encoding="utf-8")
    print(f"Wrote {args.output}", file=sys.stderr)
    if args.push:
        _push_event(event, args.config)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
