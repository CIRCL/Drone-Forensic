#!/usr/bin/env python3
"""
Decode an INAV FLASH_CONFIG binary 
Extract Pilot and UAV name
Extract flight coordinates
"""

import argparse
import re
import struct
from dataclasses import dataclass
from html import escape
from pathlib import Path
from typing import Dict, Iterable, List, Optional, Tuple


CONFIG_FOOTER_TERMINATOR = 0
CONFIG_RECORD_HEADER_SIZE = 6  # sizeof(configRecord_t)
CLASSIFICATION_NAMES = {
    0: "system",
    1: "profile 1",
    2: "profile 2",
    3: "profile 3",
}

PG_SYSTEM_CONFIG = 18
PG_WAYPOINT_MISSION_STORAGE = 1007

NAV_WP_ACTION_NAMES = {
    1: "WAYPOINT",
    3: "HOLD_TIME",
    4: "RTH",
    5: "SET_POI",
    6: "JUMP",
    7: "SET_HEAD",
    8: "LAND",
}

NAV_WP_FLAG_LAST = 0xA5
DEFAULT_PG_HEADER = Path(__file__).resolve().parent / "inav_parameter_group_ids.h"


@dataclass
class ConfigRecord:
    offset: int
    size: int
    pgn: int
    version: int
    flags: int
    payload: bytes


@dataclass
class ConfigDump:
    format_version: int
    records: List[ConfigRecord]
    footer_offset: int
    checksum: int
    computed_crc: int


@dataclass
class Waypoint:
    index: int
    lat: int
    lon: int
    alt: int
    action: int
    p1: int
    p2: int
    p3: int
    flag: int

    @property
    def action_name(self) -> str:
        return NAV_WP_ACTION_NAMES.get(self.action, f"ACTION_{self.action}")


def crc16_ccitt(data: bytes, initial: int = 0) -> int:
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
    pattern = re.compile(r"#define\s+(PG_[A-Za-z0-9_]+)\s+([0-9]+)")
    mapping: Dict[int, str] = {}
    try:
        text = header_path.read_text()
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
    classification = flags & 0x3
    class_desc = CLASSIFICATION_NAMES.get(classification, f"unknown ({classification})")
    other_flags = flags & ~0x3
    if other_flags:
        return f"{class_desc}, extra flags 0x{other_flags:02X}"
    return class_desc


def generate_report(
    dump: ConfigDump, pgn_map: Dict[int, str]
) -> Tuple[str, Optional[str], Optional[str], List[Waypoint]]:
    lines: List[str] = []
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

    for idx, record in enumerate(dump.records, start=1):
        pg_name = pgn_map.get(record.pgn, "(unknown PGN)")
        lines.append(
            f"Record {idx}: {pg_name} (PGN {record.pgn} / 0x{record.pgn:04X})"
        )
        lines.append(
            f"  Version {record.version}, classification: {describe_flags(record.flags)}"
        )
        lines.append(
            f"  Payload size: {len(record.payload)} bytes (record size {record.size} bytes, offset 0x{record.offset:04X})"
        )
        if record.pgn == PG_SYSTEM_CONFIG and len(record.payload) >= 34:
            craft_name = record.payload[-34:-17].split(b"\x00", 1)[0].decode(
                "utf-8", "ignore"
            )
            pilot_name = record.payload[-17:].split(b"\x00", 1)[0].decode(
                "utf-8", "ignore"
            )
        elif record.pgn == PG_WAYPOINT_MISSION_STORAGE:
            waypoints = decode_waypoints(record.payload)
        lines.append(format_hexdump(record.payload))
        lines.append("")

    summary_needed = any([craft_name, pilot_name, waypoints])
    if summary_needed:
        lines.append("Summary:")
        if craft_name or pilot_name:
            lines.append(f"  Craft name : {craft_name or '(unknown)'}")
            lines.append(f"  Pilot name : {pilot_name or '(unknown)'}")
        if waypoints:
            lines.append("  Mission waypoints:")
            for wp in waypoints:
                lat_deg = wp.lat / 1e7
                lon_deg = wp.lon / 1e7
                alt_m = wp.alt / 100.0
                lines.append(
                    f"    WP{wp.index:02d} {wp.action_name:<9} lat {lat_deg:+.7f}, "
                    f"lon {lon_deg:+.7f}, alt {alt_m:.2f} m"
                )
        lines.append("")

    return "\n".join(lines).rstrip() + "\n", craft_name, pilot_name, waypoints


def decode_waypoints(payload: bytes) -> List[Waypoint]:
    entry_size = 20
    if len(payload) % entry_size != 0:
        raise ValueError("Waypoint payload size is not a multiple of waypoint entry size")
    waypoints: List[Waypoint] = []
    count = len(payload) // entry_size
    for idx in range(count):
        chunk = payload[idx * entry_size : (idx + 1) * entry_size]
        lat, lon, alt, p1, p2, p3, action, flag = struct.unpack("<iii hhh BB", chunk)
        if (
            lat == 0
            and lon == 0
            and alt == 0
            and p1 == 0
            and p2 == 0
            and p3 == 0
            and action == 0
            and flag == 0
        ):  # empty slot
            continue
        if (
            lat == 0
            and lon == 0
            and alt == 0
            and action == 4
            and flag == NAV_WP_FLAG_LAST
        ):
            break
        waypoints.append(
            Waypoint(
                index=idx + 1,
                lat=lat,
                lon=lon,
                alt=alt,
                action=action,
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
        '<gpx version="1.1" creator="config_dump_to_text" xmlns="http://www.topografix.com/GPX/1/1">',
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
    parser = argparse.ArgumentParser(description="Decode INAV EEPROM/FLASH config dump")
    parser.add_argument("dump", help="Path to the raw FLASH_CONFIG binary")
    parser.add_argument(
        "-o",
        "--output",
        help="Path to the text report (defaults to stdout)",
    )
    parser.add_argument(
        "--pg-header",
        default=str(DEFAULT_PG_HEADER),
        help="Path to parameter_group_ids.h for PGN names (defaults to ./inav_parameter_group_ids.h)",
    )
    parser.add_argument(
        "--gpx-output",
        default="waypoints.gpx",
        help="Path to write GPX data from decoded mission waypoints (empty to skip)",
    )
    return parser


def main(argv: List[str] | None = None) -> int:
    parser = build_parser()
    args = parser.parse_args(argv)

    dump_path = Path(args.dump).expanduser()
    data = dump_path.read_bytes()
    config_dump = parse_config_dump(data)

    pg_map = load_pgn_map(Path(args.pg_header))
    report, craft_name, pilot_name, waypoints = generate_report(config_dump, pg_map)

    extra_notes: List[str] = []
    gpx_path: Optional[Path] = None
    if args.gpx_output:
        gpx_path = Path(args.gpx_output).expanduser()
    if gpx_path and waypoints:
        if write_waypoints_gpx(gpx_path, waypoints, craft_name, pilot_name):
            extra_notes.append(f"GPX export : {gpx_path}")

    if extra_notes:
        report = report.rstrip() + "\n" + "\n".join(extra_notes) + "\n"

    if args.output:
        output_path = Path(args.output).expanduser()
        output_path.parent.mkdir(parents=True, exist_ok=True)
        output_path.write_text(report)
    else:
        print(report, end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
