#!/usr/bin/env python3
"""Decode an INAV FLASH_CONFIG dump and extract names plus mission data.

author = "CIRCL https://www.circl.lu/"
license = "GNU Affero General Public Licence https://www.gnu.org/licenses/agpl-3.0.en.html"
"""
# pylint: disable=duplicate-code

import argparse
import hashlib
import json
import re
import struct
from dataclasses import dataclass
from html import escape
from pathlib import Path
from typing import Dict, List, Optional, Tuple

from lib.c_header_constants import load_integer_constants

CONFIG_FOOTER_TERMINATOR = 0
CONFIG_RECORD_HEADER_SIZE = 6  # sizeof(configRecord_t)
CLASSIFICATION_NAMES = {
    0: "system",
    1: "profile 1",
    2: "profile 2",
    3: "profile 3",
}

DEFAULT_PG_SYSTEM_CONFIG = 18
DEFAULT_PG_WAYPOINT_MISSION_STORAGE = 1007
DEFAULT_MAX_NAME_LENGTH = 16

DEFAULT_NAV_WP_ACTION_NAMES = {
    1: "WAYPOINT",
    3: "HOLD_TIME",
    4: "RTH",
    5: "SET_POI",
    6: "JUMP",
    7: "SET_HEAD",
    8: "LAND",
}

DEFAULT_NAV_WP_FLAG_LAST = 0xA5
DEFAULT_INCLUDE_DIR = Path(__file__).resolve().parent / "c_includes"
DEFAULT_PG_HEADER = DEFAULT_INCLUDE_DIR / "inav_parameter_group_ids.h"
DEFAULT_CONFIG_HEADER = DEFAULT_INCLUDE_DIR / "inav_config.h"
DEFAULT_NAVIGATION_HEADER = DEFAULT_INCLUDE_DIR / "inav_navigation.h"


@dataclass
class ConfigRecord:
    """One persisted parameter-group record from the INAV dump."""

    offset: int
    size: int
    pgn: int
    version: int
    flags: int
    payload: bytes


@dataclass
class ConfigDump:
    """Parsed INAV config dump with records and CRC metadata."""

    format_version: int
    records: List[ConfigRecord]
    footer_offset: int
    checksum: int
    computed_crc: int


@dataclass
class Waypoint:  # pylint: disable=too-many-instance-attributes
    """Decoded mission waypoint entry."""

    index: int
    lat: int
    lon: int
    alt: int
    action: int
    action_name: str
    p1: int
    p2: int
    p3: int
    flag: int


def crc16_ccitt(data: bytes, initial: int = 0) -> int:
    """Compute the CRC-16/CCITT value used by INAV config dumps."""

    crc = initial & 0xFFFF
    for byte in data:
        crc ^= byte << 8
        for _ in range(8):
            if crc & 0x8000:
                crc = ((crc << 1) ^ 0x1021) & 0xFFFF
            else:
                crc = (crc << 1) & 0xFFFF
    return crc


def parse_config_dump(blob: bytes) -> ConfigDump:
    """Parse a raw INAV FLASH_CONFIG blob into structured records."""

    if not blob:
        raise ValueError("Empty configuration blob")

    format_version = blob[0]
    cursor = 1
    records: List[ConfigRecord] = []

    while True:
        if cursor + 2 > len(blob):
            raise ValueError("Unexpected end of data while reading record header")
        size = int.from_bytes(blob[cursor : cursor + 2], "little")
        if size == 0:
            footer_offset = cursor
            break
        if size < CONFIG_RECORD_HEADER_SIZE:
            raise ValueError(f"Invalid record size {size} at offset {cursor}")
        end = cursor + size
        if end > len(blob):
            raise ValueError("Record exceeds buffer length")
        pgn = int.from_bytes(blob[cursor + 2 : cursor + 4], "little")
        version = blob[cursor + 4]
        flags = blob[cursor + 5]
        payload = blob[cursor + CONFIG_RECORD_HEADER_SIZE : end]
        records.append(ConfigRecord(cursor, size, pgn, version, flags, payload))
        cursor = end

    if footer_offset + 4 > len(blob):
        raise ValueError("Buffer truncated around footer/checksum")

    terminator = int.from_bytes(blob[footer_offset : footer_offset + 2], "little")
    if terminator != CONFIG_FOOTER_TERMINATOR:
        raise ValueError("Footer terminator is not zero; file may be corrupted")

    checksum = int.from_bytes(blob[footer_offset + 2 : footer_offset + 4], "little")
    computed_crc = crc16_ccitt(blob[: footer_offset + 2])

    return ConfigDump(
        format_version=format_version,
        records=records,
        footer_offset=footer_offset,
        checksum=checksum,
        computed_crc=computed_crc,
    )


def format_hexdump(data: bytes, width: int = 16) -> str:
    """Format a byte string as a compact hex and ASCII dump."""

    if not data:
        return "    (empty)"
    lines: List[str] = []
    for idx in range(0, len(data), width):
        chunk = data[idx : idx + width]
        hex_bytes = " ".join(f"{b:02X}" for b in chunk)
        ascii_view = "".join(chr(b) if 32 <= b < 127 else "." for b in chunk)
        lines.append(f"    {idx:04X}: {hex_bytes:<{width * 3 - 1}}  {ascii_view}")
    return "\n".join(lines)


def load_pgn_map(header_path: Path) -> Dict[int, str]:
    """Load numeric PG identifiers from the local INAV header."""

    pattern = re.compile(r"#define\s+(PG_[A-Za-z0-9_]+)\s+([0-9]+)")
    mapping: Dict[int, str] = {}
    try:
        text = header_path.read_text(encoding="utf-8")
    except FileNotFoundError:
        return mapping
    for line in text.splitlines():
        match = pattern.match(line.strip())
        if not match:
            continue
        name, value = match.groups()
        try:
            number = int(value, 0)
        except ValueError:
            continue
        mapping.setdefault(number, name)
    return mapping


def describe_flags(flags: int) -> str:
    """Render record classification flags as human-readable text."""

    classification = flags & 0x3
    class_desc = CLASSIFICATION_NAMES.get(classification, f"unknown ({classification})")
    other_flags = flags & ~0x3
    if other_flags:
        return f"{class_desc}, extra flags 0x{other_flags:02X}"
    return class_desc


def load_runtime_constants(
    pg_header_path: Path,
    config_header_path: Optional[Path],
    navigation_header_path: Optional[Path],
) -> Tuple[int, int, int, int, int, Dict[int, str]]:
    """Load PG and navigation constants from the bundled C headers."""

    pg_constants = load_integer_constants(pg_header_path)
    system_config_pgn = pg_constants.get("PG_SYSTEM_CONFIG", DEFAULT_PG_SYSTEM_CONFIG)
    waypoint_storage_pgn = pg_constants.get(
        "PG_WAYPOINT_MISSION_STORAGE",
        DEFAULT_PG_WAYPOINT_MISSION_STORAGE,
    )

    max_name_length = DEFAULT_MAX_NAME_LENGTH
    if config_header_path and config_header_path.exists():
        config_constants = load_integer_constants(config_header_path)
        max_name_length = config_constants.get("MAX_NAME_LENGTH", max_name_length)

    nav_wp_flag_last = DEFAULT_NAV_WP_FLAG_LAST
    nav_wp_action_rth = 4
    nav_wp_action_names = dict(DEFAULT_NAV_WP_ACTION_NAMES)
    if navigation_header_path and navigation_header_path.exists():
        nav_constants = load_integer_constants(navigation_header_path)
        nav_wp_flag_last = nav_constants.get("NAV_WP_FLAG_LAST", nav_wp_flag_last)
        nav_wp_action_rth = nav_constants.get("NAV_WP_ACTION_RTH", nav_wp_action_rth)
        action_names = {
            value: name.removeprefix("NAV_WP_ACTION_")
            for name, value in nav_constants.items()
            if name.startswith("NAV_WP_ACTION_")
        }
        if action_names:
            nav_wp_action_names = action_names

    return (
        system_config_pgn,
        waypoint_storage_pgn,
        max_name_length,
        nav_wp_flag_last,
        nav_wp_action_rth,
        nav_wp_action_names,
    )


def compute_file_hashes(data: bytes) -> Tuple[str, str]:
    """Return MD5 and SHA-256 hashes for the supplied dump bytes."""

    return hashlib.md5(data).hexdigest(), hashlib.sha256(data).hexdigest()


def serialize_waypoint(waypoint: Waypoint) -> Dict[str, object]:
    """Convert a waypoint dataclass into a JSON-serializable mapping."""

    return {
        "index": waypoint.index,
        "action": waypoint.action,
        "action_name": waypoint.action_name,
        "latitude": waypoint.lat / 1e7,
        "longitude": waypoint.lon / 1e7,
        "altitude_m": waypoint.alt / 100.0,
        "p1": waypoint.p1,
        "p2": waypoint.p2,
        "p3": waypoint.p3,
        "flag": waypoint.flag,
    }


def build_result(  # pylint: disable=too-many-arguments,too-many-positional-arguments
    craft_name: Optional[str],
    pilot_name: Optional[str],
    waypoints: List[Waypoint],
    file_md5: str,
    file_sha256: str,
    gpx_output: Optional[str] = None,
) -> Dict[str, object]:
    """Build the normalized result payload shared by all output modes."""

    result: Dict[str, object] = {
        "craft_name": craft_name or "(unknown)",
        "pilot_name": pilot_name or "(unknown)",
        "md5": file_md5,
        "sha256": file_sha256,
        "waypoint_count": len(waypoints),
        "waypoints": [serialize_waypoint(waypoint) for waypoint in waypoints],
    }
    if gpx_output:
        result["gpx_output"] = gpx_output
    return result


def generate_summary(  # pylint: disable=too-many-arguments,too-many-positional-arguments
    craft_name: Optional[str],
    pilot_name: Optional[str],
    waypoints: List[Waypoint],
    file_md5: str,
    file_sha256: str,
    gpx_output: Optional[str] = None,
) -> str:
    """Render the default human-readable result block."""

    result = build_result(
        craft_name,
        pilot_name,
        waypoints,
        file_md5,
        file_sha256,
        gpx_output,
    )
    lines = [
        "Results:",
        f"  Craft name    : {result['craft_name']}",
        f"  Pilot name    : {result['pilot_name']}",
        f"  MD5           : {result['md5']}",
        f"  SHA256        : {result['sha256']}",
        f"  Waypoint count: {result['waypoint_count']}",
    ]
    if gpx_output:
        lines.append(f"  GPX export    : {gpx_output}")
    return "\n".join(lines) + "\n"


def generate_json_result(  # pylint: disable=too-many-arguments,too-many-positional-arguments
    craft_name: Optional[str],
    pilot_name: Optional[str],
    waypoints: List[Waypoint],
    file_md5: str,
    file_sha256: str,
    gpx_output: Optional[str] = None,
) -> str:
    """Render the extracted result as formatted JSON."""

    result = build_result(
        craft_name,
        pilot_name,
        waypoints,
        file_md5,
        file_sha256,
        gpx_output,
    )
    return json.dumps(result, indent=2) + "\n"


def generate_report(  # pylint: disable=too-many-arguments,too-many-positional-arguments,too-many-locals
    dump: ConfigDump,
    pgn_map: Dict[int, str],
    file_md5: str,
    file_sha256: str,
    system_config_pgn: int,
    waypoint_storage_pgn: int,
    max_name_length: int,
    nav_wp_flag_last: int,
    nav_wp_action_rth: int,
    nav_wp_action_names: Dict[int, str],
) -> Tuple[str, Optional[str], Optional[str], List[Waypoint]]:
    """Render the verbose INAV report and return extracted summary fields."""

    lines: List[str] = []
    lines.append(f"File MD5            : {file_md5}")
    lines.append(f"File SHA256         : {file_sha256}")
    lines.append(f"EEPROM format version: {dump.format_version}")
    lines.append(
        f"CRC check: computed 0x{dump.computed_crc:04X}, stored 0x{dump.checksum:04X}"
    )
    if dump.computed_crc == dump.checksum:
        lines.append("CRC status: OK")
    else:
        lines.append("CRC status: MISMATCH")
    lines.append(f"Records found: {len(dump.records)}")
    lines.append("")

    craft_name: Optional[str] = None
    pilot_name: Optional[str] = None
    waypoints: List[Waypoint] = []

    entry_len = max_name_length + 1

    for idx, record in enumerate(dump.records, start=1):
        pg_name = pgn_map.get(record.pgn, "(unknown PGN)")
        lines.append(
            f"Record {idx}: {pg_name} (PGN {record.pgn} / 0x{record.pgn:04X})"
        )
        lines.append(
            f"  Version {record.version}, classification: {describe_flags(record.flags)}"
        )
        lines.append(
            "  Payload size: "
            f"{len(record.payload)} bytes "
            f"(record size {record.size} bytes, offset 0x{record.offset:04X})"
        )
        if record.pgn == system_config_pgn and len(record.payload) >= entry_len * 2:
            craft_name = record.payload[-entry_len * 2 : -entry_len].split(
                b"\x00", 1
            )[0].decode(
                "utf-8", "ignore"
            )
            pilot_name = record.payload[-entry_len:].split(b"\x00", 1)[0].decode(
                "utf-8", "ignore"
            )
        elif record.pgn == waypoint_storage_pgn:
            waypoints = decode_waypoints(
                record.payload,
                nav_wp_flag_last,
                nav_wp_action_rth,
                nav_wp_action_names,
            )
        lines.append(format_hexdump(record.payload))
        lines.append("")

    summary_needed = any([craft_name, pilot_name, waypoints])
    if summary_needed:
        lines.append(
            generate_summary(
                craft_name,
                pilot_name,
                waypoints,
                file_md5,
                file_sha256,
            ).rstrip()
        )
        if waypoints:
            lines.append("  Mission waypoints:")
            for waypoint in waypoints:
                lat_deg = waypoint.lat / 1e7
                lon_deg = waypoint.lon / 1e7
                alt_m = waypoint.alt / 100.0
                lines.append(
                    f"    WP{waypoint.index:02d} {waypoint.action_name:<9} "
                    f"lat {lat_deg:+.7f}, lon {lon_deg:+.7f}, alt {alt_m:.2f} m"
                )
        lines.append("")

    return "\n".join(lines).rstrip() + "\n", craft_name, pilot_name, waypoints


def _is_empty_waypoint(lat: int, lon: int, alt: int, values: Tuple[int, ...]) -> bool:
    """Return whether a waypoint slot is completely empty."""

    return lat == 0 and lon == 0 and alt == 0 and all(value == 0 for value in values)


def decode_waypoints(  # pylint: disable=too-many-locals
    payload: bytes,
    nav_wp_flag_last: int,
    nav_wp_action_rth: int,
    nav_wp_action_names: Dict[int, str],
) -> List[Waypoint]:
    """Decode serialized `navWaypoint_t` entries from the mission payload."""

    entry_size = 20
    if len(payload) % entry_size != 0:
        raise ValueError(
            "Waypoint payload size is not a multiple of waypoint entry size"
        )
    waypoints: List[Waypoint] = []
    count = len(payload) // entry_size
    for idx in range(count):
        chunk = payload[idx * entry_size : (idx + 1) * entry_size]
        lat, lon, alt, p1, p2, p3, action, flag = struct.unpack("<iii hhh BB", chunk)
        if _is_empty_waypoint(lat, lon, alt, (p1, p2, p3, action, flag)):
            continue
        if (
            lat == 0
            and lon == 0
            and alt == 0
            and action == nav_wp_action_rth
            and flag == nav_wp_flag_last
        ):
            break
        waypoints.append(
            Waypoint(
                index=idx + 1,
                lat=lat,
                lon=lon,
                alt=alt,
                action=action,
                action_name=nav_wp_action_names.get(action, f"ACTION_{action}"),
                p1=p1,
                p2=p2,
                p3=p3,
                flag=flag,
            )
        )
    return waypoints


def write_waypoints_gpx(
    output_path: Path,
    waypoints: List[Waypoint],
    craft_name: Optional[str],
    pilot_name: Optional[str],
) -> bool:
    """Write decoded waypoints as a GPX track and waypoint set."""

    valid_waypoints = [wp for wp in waypoints if not (wp.lat == 0 and wp.lon == 0)]
    if not valid_waypoints:
        return False

    title_parts = ["INAV Mission"]
    if craft_name:
        title_parts.append(craft_name)
    if pilot_name:
        title_parts.append(pilot_name)
    title = " - ".join(title_parts)
    track_name = craft_name or "Mission Track"

    lines = [
        '<?xml version="1.0" encoding="UTF-8"?>',
        (
            '<gpx version="1.1" creator="config_dump_to_text" '
            'xmlns="http://www.topografix.com/GPX/1/1">'
        ),
        "  <metadata>",
        f"    <name>{escape(title)}</name>",
        "  </metadata>",
        "  <trk>",
        f"    <name>{escape(track_name)}</name>",
        "    <trkseg>",
    ]

    for wp in valid_waypoints:
        lat = wp.lat / 1e7
        lon = wp.lon / 1e7
        ele = wp.alt / 100.0
        label = f"WP{wp.index:02d} {wp.action_name}"
        lines.append(f'      <trkpt lat="{lat:.7f}" lon="{lon:.7f}">')
        lines.append(f"        <ele>{ele:.2f}</ele>")
        lines.append(f"        <name>{escape(label)}</name>")
        lines.append("      </trkpt>")

    lines.append("    </trkseg>")
    lines.append("  </trk>")

    for wp in valid_waypoints:
        lat = wp.lat / 1e7
        lon = wp.lon / 1e7
        ele = wp.alt / 100.0
        label = f"WP{wp.index:02d} {wp.action_name}"
        lines.append(f'  <wpt lat="{lat:.7f}" lon="{lon:.7f}">')
        lines.append(f"    <name>{escape(label)}</name>")
        lines.append(f"    <ele>{ele:.2f}</ele>")
        lines.append("  </wpt>")

    lines.append("</gpx>")

    output_path.parent.mkdir(parents=True, exist_ok=True)
    output_path.write_text("\n".join(lines) + "\n", encoding="utf-8")
    return True


def build_parser() -> argparse.ArgumentParser:
    """Build the command-line interface parser."""

    parser = argparse.ArgumentParser(description="Decode INAV EEPROM/FLASH config dump")
    parser.add_argument("dump", help="Path to the raw FLASH_CONFIG binary")
    parser.add_argument(
        "-o",
        "--output",
        help="Path to the text report (defaults to stdout)",
    )
    parser.add_argument(
        "--pg-header",
        default=None,
        help="Path to parameter_group_ids.h for PGN names (auto-detected if omitted)",
    )
    parser.add_argument(
        "--gpx-output",
        default="waypoints.gpx",
        help="Path to write GPX data from decoded mission waypoints (empty to skip)",
    )
    output_group = parser.add_mutually_exclusive_group()
    output_group.add_argument(
        "--verbose",
        action="store_true",
        help="Show the full decoded report instead of only the summary",
    )
    output_group.add_argument(
        "--json",
        action="store_true",
        help="Show the extracted result as JSON",
    )
    return parser


def main(argv: List[str] | None = None) -> int:  # pylint: disable=too-many-locals,too-many-branches
    """Run the CLI entry point."""

    parser = build_parser()
    args = parser.parse_args(argv)

    dump_path = Path(args.dump).expanduser()
    data = dump_path.read_bytes()
    file_md5, file_sha256 = compute_file_hashes(data)
    config_dump = parse_config_dump(data)

    if args.pg_header:
        header_path = Path(args.pg_header).expanduser()
    else:
        header_path = DEFAULT_PG_HEADER
    if not header_path.exists():
        raise FileNotFoundError(
            f"PG header file not found at {header_path} "
            "(expected inav_parameter_group_ids.h)"
        )

    (
        system_config_pgn,
        waypoint_storage_pgn,
        max_name_length,
        nav_wp_flag_last,
        nav_wp_action_rth,
        nav_wp_action_names,
    ) = load_runtime_constants(
        header_path,
        DEFAULT_CONFIG_HEADER,
        DEFAULT_NAVIGATION_HEADER,
    )
    pg_map = load_pgn_map(header_path)
    report, craft_name, pilot_name, waypoints = generate_report(
        config_dump,
        pg_map,
        file_md5,
        file_sha256,
        system_config_pgn,
        waypoint_storage_pgn,
        max_name_length,
        nav_wp_flag_last,
        nav_wp_action_rth,
        nav_wp_action_names,
    )

    gpx_export: Optional[str] = None
    if args.gpx_output:
        gpx_path = Path(args.gpx_output).expanduser()
    else:
        gpx_path = None
    if gpx_path and waypoints:
        if write_waypoints_gpx(gpx_path, waypoints, craft_name, pilot_name):
            gpx_export = str(gpx_path)

    if args.verbose:
        output = report
        if gpx_export:
            output = output.rstrip() + f"\nGPX export : {gpx_export}\n"
    elif args.json:
        output = generate_json_result(
            craft_name,
            pilot_name,
            waypoints,
            file_md5,
            file_sha256,
            gpx_export,
        )
    else:
        output = generate_summary(
            craft_name,
            pilot_name,
            waypoints,
            file_md5,
            file_sha256,
            gpx_export,
        )

    if args.output:
        output_path = Path(args.output).expanduser()
        output_path.parent.mkdir(parents=True, exist_ok=True)
        output_path.write_text(output, encoding="utf-8")
    else:
        print(output, end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
