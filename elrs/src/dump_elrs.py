#!/usr/bin/env python3
"""Extract valid JSON objects from a raw binary file.

author = "CIRCL https://www.circl.lu/"
license = "GNU Affero General Public Licence https://www.gnu.org/licenses/agpl-3.0.en.html"
"""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path


def find_json_end(data: bytes, start: int) -> int | None:
    """Return the matching closing brace index for a JSON object start."""
    depth = 0
    in_string = False
    escaped = False

    for index in range(start, len(data)):
        byte = data[index]

        if in_string:
            if escaped:
                escaped = False
            elif byte == 0x5C:  # backslash
                escaped = True
            elif byte == 0x22:  # double quote
                in_string = False
            continue

        if byte == 0x22:  # double quote
            in_string = True
        elif byte == 0x7B:  # {
            depth += 1
        elif byte == 0x7D:  # }
            depth -= 1
            if depth == 0:
                return index
            if depth < 0:
                return None

    return None


def decode_candidate(
    candidate: bytes,
) -> dict[str, object] | None:
    """Decode and validate one JSON candidate."""
    try:
        text = candidate.decode("utf-8")
        parsed = json.loads(text)
    except (UnicodeDecodeError, json.JSONDecodeError):
        return None
    rendered = json.dumps(parsed, ensure_ascii=False)
    uid = parsed.get("uid") if isinstance(parsed, dict) else None
    valid_uid = uid if isinstance(uid, list) else None
    wifi_ssid = (
        parsed.get("wifi-ssid")
        if isinstance(parsed, dict) and isinstance(parsed.get("wifi-ssid"), str)
        else None
    )
    wifi_password = (
        parsed.get("wifi-password")
        if isinstance(parsed, dict) and isinstance(parsed.get("wifi-password"), str)
        else None
    )
    fragment = (
        rendered[1:-1]
        if rendered.startswith("{") and rendered.endswith("}")
        else rendered
    )
    return {
        "fragment": fragment,
        "config": parsed,
        "uid": valid_uid,
        "wifi_ssid": wifi_ssid,
        "wifi_password": wifi_password,
    }


def extract_json_objects(
    data: bytes,
) -> list[dict[str, object]]:
    """Extract every valid top-level JSON object found in the binary blob."""
    results: list[dict[str, object]] = []
    index = 0

    while index < len(data):
        if data[index] != 0x7B:  # {
            index += 1
            continue

        end = find_json_end(data, index)
        if end is None:
            index += 1
            continue

        decoded = decode_candidate(data[index : end + 1])
        if decoded is not None:
            results.append(decoded)
            index = end + 1
            continue

        index += 1

    return results


def compute_hashes(data: bytes) -> tuple[str, str]:
    """Compute the MD5 and SHA-256 hashes of the input blob."""
    return hashlib.md5(data).hexdigest(), hashlib.sha256(data).hexdigest()


def build_json_payload(
    md5_hash: str, sha256_hash: str, entries: list[dict[str, object]], debug: bool
) -> dict[str, object]:
    """Build the structured JSON output payload."""
    payload: dict[str, object] = {
        "md5": md5_hash,
        "sha256": sha256_hash,
        "extracted": [],
    }
    extracted: list[dict[str, object]] = []
    for entry in entries:
        item: dict[str, object] = {}
        if entry["uid"] is not None:
            item["uid"] = entry["uid"]
        if entry["wifi_ssid"] is not None:
            item["wifi-ssid"] = entry["wifi_ssid"]
        if entry["wifi_password"] is not None:
            item["wifi-password"] = entry["wifi_password"]
        if debug:
            item["config"] = entry["config"]
        if item:
            extracted.append(item)
    payload["extracted"] = extracted
    return payload


def print_text_output(
    md5_hash: str, sha256_hash: str, entries: list[dict[str, object]], debug: bool
) -> None:
    """Print the non-JSON output."""
    print(f"md5: {md5_hash}")
    print(f"sha256: {sha256_hash}")
    debug_fragments: list[str] = []
    for entry in entries:
        if debug:
            debug_fragments.append(str(entry["fragment"]))
        if entry["uid"] is not None:
            uid_text = str(entry["uid"]).replace(" ", "").replace("[", "").replace("]", "")
            print(f"uid:{uid_text}")
        if entry["wifi_ssid"] is not None:
            print(f'wifi-ssid: {entry["wifi_ssid"]}')
        if entry["wifi_password"] is not None:
            print(f'wifi-password: {entry["wifi_password"]}')
    if debug:
        for fragment in debug_fragments:
            print(fragment)


def main() -> None:
    """Parse arguments, extract JSON objects, and print valid ones."""
    parser = argparse.ArgumentParser(
        description="Extract valid JSON objects from a raw binary file."
    )
    parser.add_argument(
        "--debug", action="store_true", help="Print the extracted JSON fragments"
    )
    parser.add_argument(
        "--json", action="store_true", help="Print hashes and extracted data as JSON"
    )
    parser.add_argument("input", type=Path, help="Path to the raw binary file")
    args = parser.parse_args()

    data = args.input.read_bytes()
    md5_hash, sha256_hash = compute_hashes(data)
    entries = extract_json_objects(data)

    if args.json:
        payload = build_json_payload(md5_hash, sha256_hash, entries, args.debug)
        print(json.dumps(payload, ensure_ascii=False, indent=2))
        return

    print_text_output(md5_hash, sha256_hash, entries, args.debug)


if __name__ == "__main__":
    main()
