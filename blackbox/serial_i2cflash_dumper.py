#!/usr/bin/env python3
import os
import subprocess
import time

PORT = "/dev/ttyUSB0"
BAUD = "115200"
CHIP = "esp8266"
BLOCK_SIZE = 0x90  # 144 bytes
FLASH_SIZE = 0x200000  # 2 MB
OUT_DIR = "blocks"
OUTPUT_FILE = "esp8285_flash_dump_resume.bin"
MAX_RETRIES = 5

os.makedirs(OUT_DIR, exist_ok=True)
total_blocks = FLASH_SIZE // BLOCK_SIZE


def run(cmd):
    return subprocess.run(cmd, shell=True, capture_output=True, text=True)


for i in range(total_blocks):
    offset = i * BLOCK_SIZE
    out = f"{OUT_DIR}/block_{i:06X}.bin"

    if os.path.exists(out) and os.path.getsize(out) == BLOCK_SIZE:
        continue

    print(f"[*] Reading block {i + 1}/{total_blocks} at 0x{offset:06X}")
    cmd = (
        f"esptool --port {PORT} --baud {BAUD} --chip {CHIP} "
        f"read_flash 0x{offset:06X} {BLOCK_SIZE} {out}"
    )

    for attempt in range(1, MAX_RETRIES + 1):
        result = run(cmd)
        if result.returncode == 0:
            print("[*] Block read OK")
            break

        print(f"[!] Read failed, retry {attempt}/{MAX_RETRIES}")
        time.sleep(0.5)
    else:
        print(f"[!] Block read failed at 0x{offset:06X}, stopping dump")
        break

print("[*] Merging blocks...")
with open(OUTPUT_FILE, "wb") as f_out:
    for i in range(total_blocks):
        block_path = f"{OUT_DIR}/block_{i:06X}.bin"
        if os.path.exists(block_path):
            with open(block_path, "rb") as f_in:
                f_out.write(f_in.read())
            continue

        print(f"[!] Missing block at 0x{(i * BLOCK_SIZE):06X}, stopping merge")
        break

print(f"[*] Dump complete: {OUTPUT_FILE}")
