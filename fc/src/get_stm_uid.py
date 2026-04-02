#!/usr/bin/env python3
"""Read the STM32 UID using `st-flash`.

author = "CIRCL https://www.circl.lu/"
license = "GNU Affero General Public Licence https://www.gnu.org/licenses/agpl-3.0.en.html"
"""

from __future__ import annotations

import argparse
import json
import shutil
import subprocess
import sys
from pathlib import Path


UID_ADDRESS_BY_CHIP = {
    "F405": 0x1FFF7A10,
    "F411": 0x1FFF7A10,
    "F446": 0x1FFF7A10,
    "F722": 0x1FF07A10,
    "F723": 0x1FF07A10,
    "F730": 0x1FF07A10,
    "F732": 0x1FF07A10,
    "F733": 0x1FF07A10,
    "F745": 0x1FF0F420,
    "F746": 0x1FF0F420,
    "F756": 0x1FF0F420,
    "F765": 0x1FF0F420,
    "F767": 0x1FF0F420,
    "F769": 0x1FF0F420,
    "H723": 0x1FF1E800,
    "H725": 0x1FF1E800,
    "H730": 0x1FF1E800,
    "H735": 0x1FF1E800,
    "H743": 0x1FF1E800,
    "H745": 0x1FF1E800,
    "H747": 0x1FF1E800,
    "H750": 0x1FF1E800,
    "H753": 0x1FF1E800,
    "H755": 0x1FF1E800,
    "H757": 0x1FF1E800,
    "H7A3": 0x08FFF800,
}
UID_SIZE_BYTES = 12


def check_tool_exists(tool_name: str) -> str:
    """Ensure a required tool exists in PATH."""

    tool_path = shutil.which(tool_name)
    if not tool_path:
        raise RuntimeError(f"{tool_name} not found in PATH")
    return tool_path


def normalize_chip_name(chip: str) -> str:
    """Normalize a shorthand STM32 chip name."""

    normalized = chip.upper().replace("STM32", "").replace("XX", "")
    if normalized not in UID_ADDRESS_BY_CHIP:
        raise ValueError(f"Unsupported STM32 chip '{chip}'")
    return normalized


def read_uid_with_st_flash(chip: str, output_path: Path) -> bytes:
    """Read the MCU UID with `st-flash read` and return the raw bytes."""

    st_flash = check_tool_exists("st-flash")
    uid_address = UID_ADDRESS_BY_CHIP[chip]
    command = [
        st_flash,
        "read",
        str(output_path),
        f"0x{uid_address:08X}",
        str(UID_SIZE_BYTES),
    ]
    result = subprocess.run(
        command,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        text=True,
        check=False,
    )
    if result.returncode != 0:
        raise RuntimeError(
            "st-flash failed\n"
            f"Command: {' '.join(command)}\n"
            f"STDOUT:\n{result.stdout}\n"
            f"STDERR:\n{result.stderr}"
        )
    if not output_path.exists():
        raise RuntimeError("st-flash did not create the UID output file")
    data = output_path.read_bytes()
    if len(data) != UID_SIZE_BYTES:
        raise RuntimeError(
            f"Unexpected UID size: got {len(data)} bytes, expected {UID_SIZE_BYTES}"
        )
    return data


def format_betaflight_mcu_id(raw_bytes: bytes) -> str:
    """Format the raw UID the same way Betaflight prints `mcu_id`."""

    words = [
        int.from_bytes(raw_bytes[index : index + 4], byteorder="little")
        for index in range(0, UID_SIZE_BYTES, 4)
    ]
    return "0x" + "".join(f"{word:08x}" for word in words).lstrip("0")


def print_uid(chip: str, raw_bytes: bytes) -> None:
    """Print the UID in a compact human-readable form."""

    print(f"Chip        : STM32{chip}")
    print(f"UID address : 0x{UID_ADDRESS_BY_CHIP[chip]:08X}")
    print("UID bytes   : " + " ".join(f"{byte:02X}" for byte in raw_bytes))
    print(f"mcu_id      : {format_betaflight_mcu_id(raw_bytes)}")


def build_uid_result(chip: str, raw_bytes: bytes) -> dict[str, object]:
    """Build the normalized UID result for JSON output."""

    return {
        "chip": chip,
        "uid_address": f"0x{UID_ADDRESS_BY_CHIP[chip]:08X}",
        "uid_bytes": [f"{byte:02X}" for byte in raw_bytes],
        "mcu_id": format_betaflight_mcu_id(raw_bytes),
    }


def print_uid_json(chip: str, raw_bytes: bytes) -> None:
    """Print the UID result as JSON."""

    print(json.dumps(build_uid_result(chip, raw_bytes), indent=2))


def build_parser() -> argparse.ArgumentParser:
    """Build the command-line interface parser."""

    parser = argparse.ArgumentParser(description="Read STM32 UID using st-flash")
    parser.add_argument(
        "chip",
        nargs="?",
        help="STM32 chip, e.g. F405, F722, F745, F765, H743 or H7A3",
    )
    parser.add_argument(
        "-o",
        "--output",
        default="uid.bin",
        help="Path to the raw UID dump file (default: uid.bin)",
    )
    parser.add_argument(
        "--list",
        action="store_true",
        help="List supported STM32 chips and UID addresses",
    )
    parser.add_argument(
        "--json",
        action="store_true",
        help="Show the result as JSON",
    )
    return parser


def list_supported_chips() -> None:
    """Print the supported STM32 chips."""

    print("Supported STM32 chips:")
    for chip, uid_address in sorted(UID_ADDRESS_BY_CHIP.items()):
        print(f"  {chip:4s} uid_address=0x{uid_address:08X} size={UID_SIZE_BYTES:2d} bytes")


def print_supported_chips_json() -> None:
    """Print the supported STM32 chips as JSON."""

    supported = [
        {
            "chip": chip,
            "uid_address": f"0x{uid_address:08X}",
            "size": UID_SIZE_BYTES,
        }
        for chip, uid_address in sorted(UID_ADDRESS_BY_CHIP.items())
    ]
    print(json.dumps(supported, indent=2))


def main() -> int:
    """Run the CLI entry point."""

    parser = build_parser()
    args = parser.parse_args()
    if args.list:
        if args.json:
            print_supported_chips_json()
        else:
            list_supported_chips()
        return 0
    if not args.chip:
        parser.error("chip is required unless --list is used")
    chip = normalize_chip_name(args.chip)
    output_path = Path(args.output).expanduser()
    raw_uid = read_uid_with_st_flash(chip, output_path)
    try:
        if args.json:
            print_uid_json(chip, raw_uid)
        else:
            print_uid(chip, raw_uid)
    finally:
        output_path.unlink(missing_ok=True)
    return 0


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except (RuntimeError, ValueError) as error:
        print(f"Error: {error}", file=sys.stderr)
        raise SystemExit(1) from None
