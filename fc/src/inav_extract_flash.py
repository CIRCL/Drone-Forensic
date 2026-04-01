#!/usr/bin/env python3
"""Extract the FLASH_CONFIG region from an STM32 ROM dump.

The script knows where INAV stores its persistent configuration for a subset of
STM32 targets (via linker scripts such as ``stm32_flash_f722xe.ld``).  Provide a
ROM dump and the hardware identifier, and it will copy the FLASH_CONFIG window
into a separate file for further analysis.

author = "CIRCL https://www.circl.lu/"
license = "GNU Affero General Public Licence https://www.gnu.org/licenses/agpl-3.0.en.html"
"""
# pylint: disable=duplicate-code

import argparse
from dataclasses import dataclass
from typing import Dict, Tuple

from lib.flash_extract_common import (
    build_extract_parser,
    copy_region,
    resolve_dump_path,
    resolve_output_path,
)


@dataclass(frozen=True)
class FlashRegion:
    """Describe one INAV FLASH_CONFIG window."""

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
    """Normalize a hardware identifier for alias lookup."""

    name = raw.strip().lower().replace("-", "_")
    name = name.replace(" ", "")
    return name


def resolve_hardware(name: str) -> Tuple[str, FlashRegion]:
    """Resolve a hardware identifier to a known INAV flash region."""

    normalized = normalize_hw_name(name)
    key = HARDWARE_ALIASES.get(normalized, normalized)
    region = CONFIG_REGIONS.get(key)
    if not region:
        raise KeyError(
            f"Unsupported hardware identifier '{name}'. Use --list to see options."
        )
    return key, region


def build_parser() -> argparse.ArgumentParser:
    """Build the shared CLI parser for the INAV extractor."""

    return build_extract_parser(
        description="Extract the FLASH_CONFIG block from an STM32 ROM dump",
        hardware_help="Hardware identifier, e.g. f722 or f745_bl",
    )


def list_hardware() -> None:
    """Print the supported INAV hardware identifiers."""

    print("Supported hardware identifiers:")
    for key in sorted(CONFIG_REGIONS):
        region = CONFIG_REGIONS[key]
        print(
            f"  {key:10s} origin=0x{region.origin:08X} "
            f"size={region.length:6d} bytes ({region.note})"
        )


def main(argv: list[str] | None = None) -> int:
    """Run the CLI entry point."""

    parser = build_parser()
    args = parser.parse_args(argv)

    if args.list:
        list_hardware()
        return 0

    if not args.dump or not args.hardware:
        parser.error("dump path and hardware identifier are required unless --list is used")

    dump_path = resolve_dump_path(
        args.dump,
        parser,
        expanduser=True,
        missing_message="Dump file not found: {path}",
    )

    hw_key, region = resolve_hardware(args.hardware)

    offset = region.origin - args.base_address
    output_path = resolve_output_path(dump_path, args.output, hw_key)
    try:
        copy_region(dump_path, offset, region.length, output_path)
    except ValueError as exc:
        parser.error(str(exc))
    print(
        f"Wrote {region.length} bytes from 0x{region.origin:08X} to {output_path} "
        f"(offset {offset:#x} within the dump)"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
