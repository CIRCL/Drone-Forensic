#!/usr/bin/env python3
"""
Compute the ELRS UID derived from a binding phrase.

author = "CIRCL https://www.circl.lu/"
license = "GNU Affero General Public Licence https://www.gnu.org/licenses/agpl-3.0.en.html"
"""
import hashlib


def binding_phrase_to_uid(bind_phrase: str) -> list[int]:
    """
    Reproduce uidBytesFromText() from elrs html/scan.js:
    - Build the compiler define string
    - MD5 hash it
    - Return the first 6 bytes as integers (0-255)
    """
    define = f'-DMY_BINDING_PHRASE="{bind_phrase}"'
    digest = hashlib.md5(define.encode("utf-8")).digest()
    return list(digest[:6])


if __name__ == "__main__":
    phrase = input("Binding phrase: ").strip()
    uid_bytes = binding_phrase_to_uid(phrase)
    print("UID bytes (decimal):", uid_bytes)
    print("UID bytes (hex):    ", " ".join(f"{b:02X}" for b in uid_bytes))
