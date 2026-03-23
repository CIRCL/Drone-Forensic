#!/usr/bin/env python3
"""
Look up an ELRS binding phrase from a kvrocks-backed rainbow table.

Input: six comma-separated byte values (decimal, 0-255) representing the UID.
The script will convert them to the MD5-derived key used in the rainbow table
and fetch the original binding phrase from kvrocks.
"""

from __future__ import annotations

import argparse
import sys
from typing import List

import redis


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Retrieve the binding phrase for a given ELRS UID."
    )
    parser.add_argument(
        "uid_bytes",
        help="Six comma-separated bytes (e.g. '12,34,56,78,90,12').",
    )
    parser.add_argument(
        "--kvrocks-host",
        default="127.0.0.1",
        help="kvrocks host (default: %(default)s).",
    )
    parser.add_argument(
        "--kvrocks-port",
        type=int,
        default=6666,
        help="kvrocks port (default: %(default)s).",
    )
    parser.add_argument(
        "--kvrocks-db",
        type=int,
        default=5,
        help="kvrocks database index (default: %(default)s).",
    )
    parser.add_argument(
        "--kvrocks-prefix",
        default="elrs_rainbow",
        help="Prefix for kvrocks keys that store binding phrases (default: %(default)s).",
    )
    return parser.parse_args()


def parse_uid_bytes(arg: str) -> List[int]:
    parts = [p.strip() for p in arg.split(",")]
    if len(parts) != 6:
        raise ValueError("Expecting six comma-separated values.")
    result: List[int] = []
    for part in parts:
        value = int(part, 10)
        if not 0 <= value <= 255:
            raise ValueError("Each value must be between 0 and 255.")
        result.append(value)
    return result


def uid_to_hex(uid_bytes: List[int]) -> str:
    return "".join(f"{b:02X}" for b in uid_bytes)


def make_redis_key(prefix: str, digest: str) -> str:
    return f"{prefix}:{digest}" if prefix else digest


def main() -> int:
    args = parse_args()
    try:
        uid_bytes = parse_uid_bytes(args.uid_bytes)
    except ValueError as exc:
        print(f"[!] Invalid UID bytes: {exc}", file=sys.stderr)
        return 1

    hex_key = uid_to_hex(uid_bytes)

    redis_client = redis.Redis(
        host=args.kvrocks_host,
        port=args.kvrocks_port,
        db=args.kvrocks_db,
        decode_responses=True,
    )
    try:
        redis_client.ping()
    except redis.exceptions.ConnectionError as exc:
        print(f"[!] Unable to connect to kvrocks: {exc}", file=sys.stderr)
        return 1

    redis_key = make_redis_key(args.kvrocks_prefix, hex_key)
    phrase = redis_client.get(redis_key)
    if phrase is None:
        print(f"[!] No binding phrase found for UID {hex_key}")
        return 1

    print(f"[+] UID bytes: {hex_key}")
    print(f"[+] Redis key: {redis_key}")
    print(f"[+] Binding phrase: {phrase}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
