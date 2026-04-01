#!/usr/bin/env python3
"""
Extract the Betaflight configuration region from a raw STM32 flash dump.

Usage:
    python beta_extract_flash.py <dump.bin> <stm32_model>

Example:
    python beta_extract_flash.py quad_dump.bin F722RE
        => quad_dump_flash_config_f722.bin

author = "CIRCL https://www.circl.lu/"
license = "GNU Affero General Public Licence https://www.gnu.org/licenses/agpl-3.0.en.html"
"""
# pylint: disable=duplicate-code

import re
from dataclasses import dataclass
from typing import Iterable, List, Tuple

from lib.flash_extract_common import (
    build_extract_parser,
    copy_region,
    resolve_dump_path,
    resolve_output_path,
)


@dataclass(frozen=True)
class Layout:
    """Describe the config partition for a given MCU family."""

    config_start: int
    config_size: int
    flash_base: int = 0x08000000
    source: str = ""
    note: str | None = None

    @property
    def offset(self) -> int:
        """Return the dump offset that corresponds to the config region."""

        return self.config_start - self.flash_base


# Ordered from most specific to most generic so substring matching picks the right layout.
KNOWN_LAYOUTS: List[Tuple[str, Layout]] = [
    (
        "h7a3",
        Layout(
            0x08020000,
            0x4000,
            source="stm32_flash_h7a3_2m.ld",
            note="TARGET_MCU STM32H7A3xx/STM32H7A3xxQ; FLASH_CONFIG is 16K (2 x 8K sectors)",
        ),
    ),
    (
        "h735",
        Layout(
            0x08020000,
            0x20000,
            source="stm32_flash_h735_1m.ld",
            note="TARGET_MCU STM32H735xx",
        ),
    ),
    (
        "h725",
        Layout(
            0x08020000,
            0x20000,
            source="stm32_flash_h723_1m.ld",
            note="TARGET_MCU STM32H725xx shares the H723 1MB linker layout",
        ),
    ),
    (
        "h723",
        Layout(
            0x08020000,
            0x20000,
            source="stm32_flash_h723_1m.ld",
            note="TARGET_MCU STM32H723xx",
        ),
    ),
    (
        "h743",
        Layout(
            0x08020000,
            0x20000,
            source="stm32_flash_h743_2m.ld",
            note="TARGET_MCU STM32H743xx",
        ),
    ),
    (
        "h563",
        Layout(
            0x08020000,
            0x20000,
            source="stm32_flash_h563_2m.ld",
            note="TARGET_MCU STM32H563xx",
        ),
    ),
    (
        "h5",
        Layout(
            0x08020000,
            0x20000,
            source="stm32_flash_h563_2m.ld",
            note="generic H5 fallback based on the only H5 linker script in Betaflight",
        ),
    ),
    (
        "f765",
        Layout(
            0x08008000,
            0x8000,
            source="stm32_flash_f765.ld",
            note="TARGET_MCU STM32F765xx",
        ),
    ),
    (
        "f767",
        Layout(
            0x08008000,
            0x8000,
            source="stm32_flash_f765.ld",
            note="alias using the STM32F765xx linker layout",
        ),
    ),
    (
        "f746",
        Layout(
            0x08008000,
            0x8000,
            source="stm32_flash_f74x.ld",
            note="TARGET_MCU STM32F746xx",
        ),
    ),
    (
        "f745",
        Layout(
            0x08008000,
            0x8000,
            source="stm32_flash_f74x.ld",
            note="TARGET_MCU STM32F745xx",
        ),
    ),
    (
        "f74",
        Layout(
            0x08008000,
            0x8000,
            source="stm32_flash_f74x.ld",
            note="generic alias for the STM32F745xx/STM32F746xx layout",
        ),
    ),
    (
        "f7x5",
        Layout(
            0x08008000,
            0x8000,
            source="stm32_flash_f74x.ld",
            note="generic F7x5 fallback using the F74x Betaflight linker layout",
        ),
    ),
    (
        "f722",
        Layout(
            0x08004000,
            0x4000,
            source="stm32_flash_f722.ld",
            note="TARGET_MCU STM32F722xx; config occupies the whole 16K flash sector 1",
        ),
    ),
    (
        "f72",
        Layout(
            0x08004000,
            0x4000,
            source="stm32_flash_f722.ld",
            note="generic alias using the STM32F722xx linker layout",
        ),
    ),
    (
        "g474",
        Layout(
            0x08004000,
            0x2000,
            source="stm32_flash_g474.ld",
            note="TARGET_MCU STM32G474xx",
        ),
    ),
    (
        "g473",
        Layout(
            0x08004000,
            0x2000,
            source="stm32_flash_g474.ld",
            note="Betaflight STM32G47X target identifies as G473 but uses the G474 linker script",
        ),
    ),
    (
        "g4",
        Layout(
            0x08004000,
            0x2000,
            source="stm32_flash_g474.ld",
            note="generic G4 fallback based on the Betaflight STM32G474xx linker layout",
        ),
    ),
    (
        "f446",
        Layout(
            0x08004000,
            0x4000,
            source="stm32_flash_f446.ld",
            note="TARGET_MCU STM32F446xx",
        ),
    ),
    (
        "f411",
        Layout(
            0x08004000,
            0x4000,
            source="stm32_flash_f411.ld",
            note="TARGET_MCU STM32F411xE",
        ),
    ),
    (
        "f405",
        Layout(
            0x08004000,
            0x4000,
            source="stm32_flash_f405.ld",
            note="TARGET_MCU STM32F405xx",
        ),
    ),
    (
        "f401",
        Layout(
            0x08004000,
            0x4000,
            source="stm32_flash_f411.ld",
            note="generic F401 fallback using the 16K sector-1 F4 layout",
        ),
    ),
    (
        "f4",
        Layout(
            0x08004000,
            0x4000,
            source="stm32_flash_f411.ld",
            note="generic F4 fallback using Betaflight's 16K sector-1 F4 linker layout",
        ),
    ),
]


def normalize_model(model: str) -> str:
    """Normalize a user-supplied MCU identifier for substring matching."""

    model = model.lower()
    model = model.replace("stm32", "")
    return re.sub(r"[^a-z0-9]", "", model)


def iter_supported_layouts() -> Iterable[Tuple[str, Layout]]:
    """Yield unique layout patterns in display order."""

    seen = set()
    for pattern, layout in KNOWN_LAYOUTS:
        if pattern not in seen:
            seen.add(pattern)
            yield pattern, layout


def list_supported_models() -> Iterable[str]:
    """Yield the supported normalized hardware identifiers."""

    for pattern, _layout in iter_supported_layouts():
        yield pattern


def list_hardware() -> None:
    """Print the supported Betaflight hardware identifiers."""

    print("Supported hardware identifiers:")
    for pattern, layout in iter_supported_layouts():
        detail = layout.source
        if layout.note:
            detail = f"{detail}; {layout.note}"
        print(
            f"  {pattern:10s} origin=0x{layout.config_start:08X} "
            f"size={layout.config_size:6d} bytes ({detail})"
        )


def find_layout(model: str) -> Tuple[str, Layout]:
    """Resolve a user model string to the best-known layout entry."""

    normalized = normalize_model(model)
    for pattern, layout in KNOWN_LAYOUTS:
        if pattern in normalized:
            return pattern, layout
    raise ValueError(
        f"STM32 model '{model}' not recognised. "
        f"Known patterns: {', '.join(list_supported_models())}"
    )


def main(argv: List[str] | None = None) -> int:
    """Run the CLI entry point."""

    parser = build_extract_parser(
        description="Extract the Betaflight config (EEPROM emulation) from an STM32 flash dump.",
        hardware_help="Hardware identifier, e.g. f722 or f745.",
    )
    args = parser.parse_args(argv)

    if args.list:
        list_hardware()
        return 0

    if not args.dump or not args.hardware:
        parser.error("dump path and hardware identifier are required unless --list is used")

    dump_path = resolve_dump_path(
        args.dump,
        parser,
        expanduser=False,
        missing_message="Dump file '{path}' does not exist.",
    )

    base_addr = args.base_address
    model_pattern, layout = find_layout(args.hardware)
    if layout.flash_base != base_addr:
        layout = Layout(
            config_start=layout.config_start - layout.flash_base + base_addr,
            config_size=layout.config_size,
            flash_base=base_addr,
            source=layout.source,
            note=layout.note,
        )

    model_token = normalize_model(args.hardware) or model_pattern
    output_path = resolve_output_path(dump_path, args.output, model_token)

    copy_region(dump_path, layout.offset, layout.config_size, output_path)

    print(
        f"Wrote {layout.config_size} bytes from offset 0x{layout.offset:X} "
        f"({hex(layout.config_start)}) to '{output_path}'."
    )
    if layout.note:
        print(f"Note: {layout.note}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
