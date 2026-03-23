#!/usr/bin/env python3
"""
Extract the Betaflight configuration region from a raw STM32 flash dump.

Usage:
    python beta_extract_flash.py <dump.bin> <stm32_model>

Example:
    python beta_extract_flash.py quad_dump.bin F722RE
        => quad_dump_flash_config_f722.bin
"""

import argparse
import os
import re
import sys
from dataclasses import dataclass
from pathlib import Path
from typing import Iterable, List, Tuple


@dataclass(frozen=True)
class Layout:
    """Describe the config partition for a given MCU family."""

    config_start: int
    config_size: int
    flash_base: int = 0x08000000
    note: str | None = None

    @property
    def offset(self) -> int:
        return self.config_start - self.flash_base


# Ordered from most specific to most generic so substring matching picks the right layout.
KNOWN_LAYOUTS: List[Tuple[str, Layout]] = [
    ("h7a3", Layout(0x08020000, 0x4000, note="STM32H7A3 2MB (8KB sectors, config spans 2 of them)")),
    ("h735", Layout(0x08020000, 0x20000, note="STM32H735/H725 1MB")),
    ("h725", Layout(0x08020000, 0x20000)),
    ("h723", Layout(0x08020000, 0x20000, note="STM32H723/H725 1MB")),
    ("h743", Layout(0x08020000, 0x20000, note="STM32H743/H750 2MB")),
    ("h563", Layout(0x08020000, 0x20000, note="STM32H563 2MB flash")),
    ("h5", Layout(0x08020000, 0x20000, note="Generic STM32H5 family (verify before use)")),
    ("f765", Layout(0x08008000, 0x8000, note="STM32F765/F767 2MB flash")),
    ("f767", Layout(0x08008000, 0x8000)),
    ("f746", Layout(0x08008000, 0x8000, note="STM32F745/F746/F74x 1MB flash")),
    ("f745", Layout(0x08008000, 0x8000)),
    ("f74", Layout(0x08008000, 0x8000, note="Generic STM32F74x/F75x")),
    ("f7x5", Layout(0x08008000, 0x8000, note="STM32F7x5 family")),
    ("f722", Layout(0x08004000, 0x4000, note="STM32F72x (sector 1 = 16KB)")),
    ("f72", Layout(0x08004000, 0x4000)),
    ("g474", Layout(0x08004000, 0x2000, note="STM32G474/G473 (8KB config)")),
    ("g473", Layout(0x08004000, 0x2000)),
    ("g4", Layout(0x08004000, 0x2000, note="Generic STM32G4 (verify sector size)")),
    ("f446", Layout(0x08004000, 0x4000)),
    ("f411", Layout(0x08004000, 0x4000)),
    ("f405", Layout(0x08004000, 0x4000)),
    ("f401", Layout(0x08004000, 0x4000)),
    ("f4", Layout(0x08004000, 0x4000, note="Generic STM32F4 (sector 1 = 16KB)")),
]


def normalize_model(model: str) -> str:
    model = model.lower()
    model = model.replace("stm32", "")
    return re.sub(r"[^a-z0-9]", "", model)


def list_supported_models() -> Iterable[str]:
    seen = set()
    for pattern, _layout in KNOWN_LAYOUTS:
        if pattern not in seen:
            seen.add(pattern)
            yield pattern


def find_layout(model: str) -> Tuple[str, Layout]:
    normalized = normalize_model(model)
    for pattern, layout in KNOWN_LAYOUTS:
        if pattern in normalized:
            return pattern, layout
    raise ValueError(
        f"STM32 model '{model}' not recognised. "
        f"Known patterns: {', '.join(list_supported_models())}"
    )


def extract_region(
    dump_path: Path,
    layout: Layout,
    output_path: Path,
) -> None:
    size = os.path.getsize(dump_path)
    offset = layout.offset
    end = offset + layout.config_size
    if offset < 0:
        raise ValueError(
            f"Computed negative offset (start {hex(layout.config_start)} < base {hex(layout.flash_base)})"
        )
    if end > size:
        raise ValueError(
            f"Dump '{dump_path}' is only {size} bytes, but need up to {end} bytes "
            f"to reach config region (offset {hex(offset)}, size {layout.config_size})."
        )

    with dump_path.open("rb") as src, output_path.open("wb") as dst:
        src.seek(offset)
        remaining = layout.config_size
        while remaining:
            chunk = src.read(min(remaining, 1024 * 1024))
            if not chunk:
                raise IOError("Unexpected end of file while reading config region")
            dst.write(chunk)
            remaining -= len(chunk)


def main(argv: List[str] | None = None) -> int:
    parser = argparse.ArgumentParser(
        description="Extract the Betaflight config (EEPROM emulation) from an STM32 flash dump."
    )
    parser.add_argument(
        "dump",
        nargs="?",
        help="Path to the raw flash dump file (starts at 0x08000000).",
    )
    parser.add_argument(
        "model",
        nargs="?",
        help="STM32 model (e.g. F722, STM32F765, H743).",
    )
    parser.add_argument(
        "--flash-base",
        default="0x08000000",
        help="Override the flash base address used for the dump (default: 0x08000000).",
    )
    parser.add_argument(
        "--output",
        help="Optional custom output path. If omitted, derives '<dump>_flash_config_<model>.bin'.",
    )
    parser.add_argument(
        "--list",
        action="store_true",
        help="List recognised STM32 model patterns and exit.",
    )
    args = parser.parse_args(argv)

    if args.list:
        for pattern in list_supported_models():
            print(pattern)
        return 0

    if not args.dump or not args.model:
        parser.error("dump and model are required unless --list-models is used.")

    dump_path = Path(args.dump)
    if not dump_path.is_file():
        parser.error(f"Dump file '{dump_path}' does not exist.")

    base_addr = int(args.flash_base, 0)
    model_pattern, layout = find_layout(args.model)
    if layout.flash_base != base_addr:
        layout = Layout(
            config_start=layout.config_start - layout.flash_base + base_addr,
            config_size=layout.config_size,
            flash_base=base_addr,
            note=layout.note,
        )

    model_token = normalize_model(args.model) or model_pattern
    if args.output:
        output_path = Path(args.output)
    else:
        output_name = f"{dump_path.stem}_flash_config_{model_token}.bin"
        output_path = dump_path.with_name(output_name)

    extract_region(dump_path, layout, output_path)

    print(
        f"Wrote {layout.config_size} bytes from offset 0x{layout.offset:X} "
        f"({hex(layout.config_start)}) to '{output_path}'."
    )
    if layout.note:
        print(f"Note: {layout.note}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
