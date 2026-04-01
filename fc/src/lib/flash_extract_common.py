#!/usr/bin/env python3
"""Shared helpers for FLASH_CONFIG extraction scripts.

author = "CIRCL https://www.circl.lu/"
license = "GNU Affero General Public Licence https://www.gnu.org/licenses/agpl-3.0.en.html"
"""

import argparse
import os
from pathlib import Path


def parse_int(value: str) -> int:
    """Parse an integer argument expressed in decimal or prefixed base form."""

    try:
        return int(value, 0)
    except ValueError as exc:
        raise argparse.ArgumentTypeError(f"Invalid integer literal: {value}") from exc


def build_extract_parser(
    description: str,
    hardware_help: str,
) -> argparse.ArgumentParser:
    """Build the common CLI parser used by the extract scripts."""

    parser = argparse.ArgumentParser(description=description)
    parser.add_argument("dump", nargs="?", help="Path to the ROM dump (binary file)")
    parser.add_argument("hardware", nargs="?", help=hardware_help)
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


def resolve_dump_path(
    raw_path: str,
    parser: argparse.ArgumentParser,
    *,
    expanduser: bool,
    missing_message: str,
) -> Path:
    """Validate the dump path and return it as a Path instance."""

    dump_path = Path(raw_path).expanduser() if expanduser else Path(raw_path)
    if not dump_path.is_file():
        parser.error(missing_message.format(path=dump_path))
    return dump_path


def resolve_output_path(
    dump_path: Path,
    output_arg: str | None,
    hardware_key: str,
) -> Path:
    """Return the output path, using the default naming convention when needed."""

    if output_arg:
        return Path(output_arg)
    output_name = f"{dump_path.stem}_flash_config_{hardware_key}.bin"
    return dump_path.with_name(output_name)


def copy_region(dump_path: Path, offset: int, length: int, output_path: Path) -> None:
    """Copy a region from the dump into the destination file."""

    dump_size = os.path.getsize(dump_path)
    if offset < 0:
        raise ValueError("Computed offset is negative; check the base address argument.")
    if offset + length > dump_size:
        raise ValueError(
            f"Dump is too small: need {offset + length} bytes but file is {dump_size} bytes."
        )

    output_path.parent.mkdir(parents=True, exist_ok=True)
    with dump_path.open("rb") as src, output_path.open("wb") as dst:
        src.seek(offset)
        remaining = length
        while remaining:
            chunk = src.read(min(remaining, 1024 * 1024))
            if not chunk:
                raise IOError("Unexpected end of file while reading config region")
            dst.write(chunk)
            remaining -= len(chunk)
