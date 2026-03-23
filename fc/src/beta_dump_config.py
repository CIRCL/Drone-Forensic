#!/usr/bin/env python3
"""
Decode a Betaflight FLASH_CONFIG binary and extract craft/pilot names.

Supports legacy dumps (single name), 4.x releases (craft+pilot),
and newer builds that append extra OSD message strings.
"""

import argparse
import re
from dataclasses import dataclass
from pathlib import Path
from typing import Dict, List, Optional, Tuple


CONFIG_MAGIC = 0xBE
CONFIG_RECORD_HEADER_SIZE = 6  # sizeof(configRecord_t)
CONFIG_FOOTER_TERMINATOR = 0
CRC_START_VALUE = 0xFFFF
CRC_CHECK_VALUE = 0x1D0F

CLASSIFICATION_NAMES = {
    0: "system",
    1: "profile 1",
    2: "profile 2",
    3: "profile 3",
}

PG_PILOT_CONFIG = 47
MAX_NAME_LENGTH = 16
DEFAULT_PG_HEADER = Path(__file__).resolve().parent / "beta_pg_ids.h"


@dataclass
class ConfigHeader:
    version: int
    magic: int


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
    header: ConfigHeader
    records: List[ConfigRecord]
    footer_offset: int
    stored_crc: int
    combined_crc: int

    @property
    def crc_ok(self) -> bool:
        return self.combined_crc == CRC_CHECK_VALUE


def crc16_ccitt(data: bytes, initial: int = CRC_START_VALUE) -> int:
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
    if len(blob) < 4:
        raise ValueError("Configuration blob is too short to contain header/footer")

    header = ConfigHeader(version=blob[0], magic=blob[1])
    cursor = 2
    records: List[ConfigRecord] = []

    while True:
        if cursor + 2 > len(blob):
            raise ValueError("Unexpected end of data while reading record size")
        size = int.from_bytes(blob[cursor : cursor + 2], "little")
        if size == 0:
            footer_offset = cursor
            break
        if size < CONFIG_RECORD_HEADER_SIZE:
            raise ValueError(f"Invalid record size {size} at offset {cursor}")

        end = cursor + size
        if end > len(blob):
            raise ValueError("Record exceeds buffer bounds")

        pgn = int.from_bytes(blob[cursor + 2 : cursor + 4], "little")
        version = blob[cursor + 4]
        flags = blob[cursor + 5]
        payload = blob[cursor + CONFIG_RECORD_HEADER_SIZE : end]

        records.append(
            ConfigRecord(
                offset=cursor,
                size=size,
                pgn=pgn,
                version=version,
                flags=flags,
                payload=payload,
            )
        )
        cursor = end

    if footer_offset + 4 > len(blob):
        raise ValueError("Buffer truncated near footer/checksum region")

    terminator = int.from_bytes(blob[footer_offset : footer_offset + 2], "little")
    if terminator != CONFIG_FOOTER_TERMINATOR:
        raise ValueError("Footer terminator is not zero; dump may be corrupted")

    stored_crc = int.from_bytes(blob[footer_offset + 2 : footer_offset + 4], "little")
    crc_region = blob[: footer_offset + 4]
    combined_crc = crc16_ccitt(crc_region, CRC_START_VALUE)

    return ConfigDump(
        header=header,
        records=records,
        footer_offset=footer_offset,
        stored_crc=stored_crc,
        combined_crc=combined_crc,
    )


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


def _decode_string(field: bytes) -> Optional[str]:
    text = field.split(b"\x00", 1)[0].decode("utf-8", "ignore").strip()
    return text or None


def decode_names(payload: bytes, record_version: int) -> Tuple[Optional[str], Optional[str]]:
    """
    pilotConfig layout by firmware generation:
      v0 (≤3.5):        only craft name
      v1 (4.0–4.3):     craft + display/pilot name
      v2 (≥4.4/latest): craft + pilot + OSD messages
    """
    if not payload:
        return None, None

    entry_len = MAX_NAME_LENGTH + 1
    craft = None
    pilot = None

    if len(payload) < entry_len:
        return _decode_string(payload), None

    craft = _decode_string(payload[:entry_len])

    has_second_field = record_version >= 1 and len(payload) >= entry_len * 2
    if has_second_field:
        pilot = _decode_string(payload[entry_len : entry_len * 2])
    elif record_version >= 1 and len(payload) > entry_len:
        pilot = _decode_string(payload[entry_len:])

    return craft, pilot


def generate_report(
    dump: ConfigDump, pgn_map: Dict[int, str]
) -> Tuple[str, Optional[str], Optional[str]]:
    lines: List[str] = []
    lines.append(f"EEPROM format version : {dump.header.version}")
    if dump.header.magic == CONFIG_MAGIC:
        lines.append("Header magic          : 0xBE (OK)")
    else:
        lines.append(
            f"Header magic          : 0x{dump.header.magic:02X} (expected 0x{CONFIG_MAGIC:02X})"
        )
    lines.append(
        f"Stored CRC (raw)      : 0x{dump.stored_crc:04X} (little-endian as in dump)"
    )
    lines.append(
        f"Combined CRC          : 0x{dump.combined_crc:04X} (expected 0x{CRC_CHECK_VALUE:04X})"
    )
    lines.append(f"CRC status            : {'OK' if dump.crc_ok else 'MISMATCH'}")
    lines.append(f"Records found         : {len(dump.records)}")
    lines.append("")

    craft_name: Optional[str] = None
    pilot_name: Optional[str] = None

    for idx, record in enumerate(dump.records, start=1):
        pg_name = pgn_map.get(record.pgn, f"PGN_{record.pgn}")
        lines.append(
            f"Record {idx}: {pg_name} (PGN {record.pgn} / 0x{record.pgn:04X})"
        )
        lines.append(
            f"  Version {record.version}, classification: {describe_flags(record.flags)}"
        )
        lines.append(
            f"  Payload size: {len(record.payload)} bytes (record size {record.size} bytes, offset 0x{record.offset:04X})"
        )
        if record.pgn == PG_PILOT_CONFIG:
            craft, pilot = decode_names(record.payload, record.version)
            craft_name = craft_name or craft
            pilot_name = pilot_name or pilot
        lines.append(format_hexdump(record.payload))
        lines.append("")

    if craft_name or pilot_name:
        lines.append("Summary:")
        lines.append(f"  Craft name : {craft_name or '(unknown)'}")
        lines.append(f"  Pilot name : {pilot_name or '(unknown)'}")
        lines.append("")

    return "\n".join(lines).rstrip() + "\n", craft_name, pilot_name


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        description="Decode Betaflight EEPROM/FLASH config dump"
    )
    parser.add_argument("dump", help="Path to the raw FLASH_CONFIG binary")
    parser.add_argument(
        "-o",
        "--output",
        help="Path to the text report (defaults to stdout)",
    )
    parser.add_argument(
        "--pg-header",
        default=None,
        help="Path to pg_ids.h for PGN names (auto-detected if omitted)",
    )
    return parser


def main(argv: Optional[List[str]] = None) -> int:
    parser = build_parser()
    args = parser.parse_args(argv)

    dump_path = Path(args.dump).expanduser()
    data = dump_path.read_bytes()
    config_dump = parse_config_dump(data)

    if args.pg_header:
        header_path = Path(args.pg_header).expanduser()
    else:
        header_path = DEFAULT_PG_HEADER
    if not header_path.exists():
        raise FileNotFoundError(
            f"PG header file not found at {header_path} (expected beta_pg_ids.h)"
        )

    pg_map = load_pgn_map(header_path)
    report, _, _ = generate_report(config_dump, pg_map)

    if args.output:
        output_path = Path(args.output).expanduser()
        output_path.parent.mkdir(parents=True, exist_ok=True)
        output_path.write_text(report)
    else:
        print(report, end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
