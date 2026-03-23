#!/usr/bin/env python3
"""Extract the FLASH_CONFIG region from an STM32 ROM dump.

The script knows where INAV stores its persistent configuration for a subset of
STM32 targets (via linker scripts such as ``stm32_flash_f722xe.ld``).  Provide a
ROM dump and the hardware identifier, and it will copy the FLASH_CONFIG window
into a separate file for further analysis.
"""

import argparse
import os
from dataclasses import dataclass
from pathlib import Path
from typing import Dict, Tuple


@dataclass(frozen=True)
class FlashRegion:
    origin: int
    length: int
    note: str


# Known FLASH_CONFIG windows (origin/size pulled from link scripts in
# src/main/target/link).  Extend this map if you add new targets.
CONFIG_REGIONS: Dict[str, FlashRegion] = {
    "f411": FlashRegion(0x08004000, 16 * 1024, "stm32_flash_f411xe.ld"),
    "f446": FlashRegion(0x08004000, 16 * 1024, "stm32_flash_f446xe.ld"),
    "f405": FlashRegion(0x080E0000, 128 * 1024, "stm32_flash_f405xg.ld"),
    "f427": FlashRegion(0x080E0000, 128 * 1024, "stm32_flash_f427xg.ld"),
    "f405_bl": FlashRegion(0x080E0000, 128 * 1024, "stm32_flash_f405xg_for_bl.ld"),
    "f722": FlashRegion(0x08004000, 16 * 1024, "stm32_flash_f722xe.ld"),
    "f722_bl": FlashRegion(0x0800C000, 16 * 1024, "stm32_flash_f722xe_bl.ld"),
    "f722_for_bl": FlashRegion(0x0800C000, 16 * 1024, "stm32_flash_f722xe_for_bl.ld"),
    "f745": FlashRegion(0x08008000, 32 * 1024, "stm32_flash_f745xg.ld"),
    "f745_bl": FlashRegion(0x08010000, 32 * 1024, "stm32_flash_f745xg_for_bl.ld"),
    "f765": FlashRegion(0x08008000, 32 * 1024, "stm32_flash_f765xg.ld"),
    "f765_bl": FlashRegion(0x08010000, 32 * 1024, "stm32_flash_f765xg_for_bl.ld"),
    "h743": FlashRegion(0x08020000, 128 * 1024, "stm32_flash_h743xi.ld"),
    "h7a3": FlashRegion(0x08020000, 16 * 1024, "stm32_flash_h7a3xi.ld"),
}


HARDWARE_ALIASES: Dict[str, str] = {
    "stm32f411": "f411",
    "stm32f446": "f446",
    "stm32f405": "f405",
    "stm32f427": "f427",
    "stm32f722": "f722",
    "stm32f722bl": "f722_bl",
    "stm32f722forbl": "f722_for_bl",
    "stm32f745": "f745",
    "stm32f745bl": "f745_bl",
    "stm32f765": "f765",
    "stm32f765bl": "f765_bl",
    "stm32h743": "h743",
    "stm32h7a3": "h7a3",
    "f411xe": "f411",
    "f446xe": "f446",
    "f405xg": "f405",
    "f427xg": "f427",
    "f722xe": "f722",
    "f722xeble": "f722_bl",
    "f722xeforbl": "f722_for_bl",
    "f745xg": "f745",
    "f745xgbl": "f745_bl",
    "f765xg": "f765",
    "f765xgbl": "f765_bl",
    "h743xi": "h743",
    "h7a3xi": "h7a3",
}


def normalize_hw_name(raw: str) -> str:
    name = raw.strip().lower().replace("-", "_")
    name = name.replace(" ", "")
    return name


def resolve_hardware(name: str) -> Tuple[str, FlashRegion]:
    normalized = normalize_hw_name(name)
    key = HARDWARE_ALIASES.get(normalized, normalized)
    region = CONFIG_REGIONS.get(key)
    if not region:
        raise KeyError(f"Unsupported hardware identifier '{name}'. Use --list to see options.")
    return key, region


def parse_int(value: str) -> int:
    try:
        return int(value, 0)
    except ValueError as exc:
        raise argparse.ArgumentTypeError(f"Invalid integer literal: {value}") from exc


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        description="Extract the FLASH_CONFIG block from an STM32 ROM dump"
    )
    parser.add_argument("dump", nargs="?", help="Path to the ROM dump (binary file)")
    parser.add_argument("hardware", nargs="?", help="Hardware identifier, e.g. f722 or f745_bl")
    parser.add_argument(
        "-o",
        "--output",
        help="Output file for the extracted config (default: <dump>_flash_config_<hw>.bin)",
    )
    parser.add_argument(
        "--base-address",
        type=parse_int,
        default=0x08000000,
        help="Base address that corresponds to offset 0 in the dump (default: 0x08000000)",
    )
    parser.add_argument(
        "--list",
        action="store_true",
        help="List supported hardware identifiers and exit",
    )
    return parser


def list_hardware() -> None:
    print("Supported hardware identifiers:")
    for key in sorted(CONFIG_REGIONS):
        region = CONFIG_REGIONS[key]
        print(f"  {key:10s} origin=0x{region.origin:08X} size={region.length:6d} bytes ({region.note})")


def extract_region(dump_path: Path, offset: int, length: int) -> bytes:
    with dump_path.open("rb") as handle:
        handle.seek(0, os.SEEK_END)
        dump_size = handle.tell()
        if offset < 0:
            raise ValueError("Computed offset is negative; check the base address argument.")
        if offset + length > dump_size:
            raise ValueError(
                f"Dump is too small: need {offset + length} bytes but file is {dump_size} bytes."
            )
        handle.seek(offset)
        return handle.read(length)


def main(argv: list[str] | None = None) -> int:
    parser = build_parser()
    args = parser.parse_args(argv)

    if args.list:
        list_hardware()
        return 0

    if not args.dump or not args.hardware:
        parser.error("dump path and hardware identifier are required unless --list is used")

    dump_path = Path(args.dump).expanduser()
    if not dump_path.is_file():
        parser.error(f"Dump file not found: {dump_path}")

    hw_key, region = resolve_hardware(args.hardware)

    offset = region.origin - args.base_address
    try:
        data = extract_region(dump_path, offset, region.length)
    except ValueError as exc:
        parser.error(str(exc))

    if args.output:
        output_path = Path(args.output)
    else:
        output_name = f"{dump_path.stem}_flash_config_{hw_key}.bin"
        output_path = dump_path.with_name(output_name)

    output_path.parent.mkdir(parents=True, exist_ok=True)
    output_path.write_bytes(data)
    print(
        f"Wrote {region.length} bytes from 0x{region.origin:08X} to {output_path} "
        f"(offset {offset:#x} within the dump)"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
