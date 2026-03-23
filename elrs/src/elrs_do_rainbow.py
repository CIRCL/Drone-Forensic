#!/usr/bin/env python3
"""
Generate a binding phrase rainbow table and store it in Redis.

- Reads entries from any supplied wordlist (e.g. rockyou.txt).
- Hashes them in parallel using multiple CPU cores.
- Persists the mapping {md5(-DMY_BINDING_PHRASE="pass")
    -> first 6 bytes -> pass} in kvrocks `prefix:UID`.
- Tracks progress in status.txt so the job for resume.
"""
import argparse
import hashlib
import json
import os
import signal
import sys
from concurrent.futures import FIRST_COMPLETED, ProcessPoolExecutor, wait
from pathlib import Path
from typing import Iterator, List, Sequence, Tuple
import redis


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Generate an MD5 rainbow table in kvrocks from a wordlist."
    )
    parser.add_argument(
        "wordlist",
        help="Path to the wordlist (e.g. rockyou.txt).",
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
        help="Prefix for kvrocks keys that store the rainbow table (default: %(default)s).",
    )
    parser.add_argument(
        "--status-file",
        type=Path,
        default=Path("status.txt"),
        help="Path to the status file (default: %(default)s).",
    )
    parser.add_argument(
        "--chunk-size",
        type=int,
        default=10_000,
        help="Number of entries to hash per batch (default: %(default)s).",
    )
    parser.add_argument(
        "--processes",
        type=int,
        default=os.cpu_count() or 1,
        help="Number of worker processes (default: CPU count).",
    )
    parser.add_argument(
        "--prefetch",
        type=int,
        default=4,
        help="Number of batches to queue ahead for hashing (default: %(default)s).",
    )
    parser.add_argument(
        "--encoding",
        default="utf-8",
        help="Encoding of the wordlist (default: %(default)s).",
    )
    return parser.parse_args()


def make_redis_key(prefix: str, digest: str) -> str:
    return f"{prefix}:{digest}" if prefix else digest


def load_status(status_path: Path) -> Tuple[int, int]:
    """
    Return (offset, processed_entries).
    Defaults to start of file if status file is missing or invalid.
    """
    if not status_path.exists():
        return 0, 0

    try:
        with status_path.open("r", encoding="utf-8") as status_file:
            data = json.load(status_file)
        return int(data.get("offset", 0)), int(data.get("processed", 0))
    except (ValueError, json.JSONDecodeError, OSError):
        return 0, 0


def write_status(status_path: Path, offset: int, processed: int) -> None:
    payload = {"offset": offset, "processed": processed}
    tmp_path = status_path.with_suffix(".tmp")
    with tmp_path.open("w", encoding="utf-8") as tmp_file:
        json.dump(payload, tmp_file)
        tmp_file.write("\n")
    tmp_path.replace(status_path)


def read_chunks(
    file_path: Path,
    *,
    encoding: str,
    chunk_size: int,
    start_offset: int = 0,
) -> Iterator[Tuple[List[str], int]]:
    """
    Yield (chunk, offset_after_chunk) tuples from the wordlist.
    Offsets are byte offsets suitable for resuming.
    """
    with file_path.open("r", encoding=encoding, errors="ignore") as wordlist:
        if start_offset:
            wordlist.seek(start_offset)

        while True:
            chunk: List[str] = []
            while len(chunk) < chunk_size:
                line = wordlist.readline()
                if not line:
                    break
                entry = line.rstrip("\r\n")
                if entry:
                    chunk.append(entry)
            if not chunk:
                break
            yield chunk, wordlist.tell()


def hash_batch(entries: Sequence[str]) -> List[Tuple[str, str]]:
    """
    Hash a batch of binding phrases and return list of (uid_hex, phrase).
    Separating hashing into a worker makes it easy to parallelise.
    """
    result: List[Tuple[str, str]] = []
    for entry in entries:
        define = f'-DMY_BINDING_PHRASE="{entry}"'
        digest = hashlib.md5(define.encode("utf-8")).digest()
        uid_hex = digest[:6].hex().upper()
        result.append((uid_hex, entry))
    return result


def configure_signal_handler(abort_flag: dict) -> None:
    def handle_signal(signum, _frame) -> None:
        abort_flag["stop"] = True
        signal.signal(signum, signal.SIG_IGN)

    signal.signal(signal.SIGINT, handle_signal)
    signal.signal(signal.SIGTERM, handle_signal)


def main() -> int:
    args = parse_args()
    wordlist_path = Path(args.wordlist)
    if not wordlist_path.is_file():
        print(f"[!] Wordlist not found: {wordlist_path}", file=sys.stderr)
        return 1

    redis_client = redis.Redis(
        host=args.kvrocks_host,
        port=args.kvrocks_port,
        db=args.kvrocks_db,
        decode_responses=True,
    )
    try:
        redis_client.ping()
    except redis.exceptions.ConnectionError as exc:
        print(f"[!] Unable to connect to Kvrocks: {exc}", file=sys.stderr)
        return 1

    offset, processed = load_status(args.status_file)
    print(f"[+] Resuming from offset={offset}, processed={processed}")

    abort_request = {"stop": False}
    configure_signal_handler(abort_request)
    completed_all = True

    with ProcessPoolExecutor(max_workers=args.processes) as pool:
        pending: dict = {}
        try:
            for batch, next_offset in read_chunks(
                wordlist_path,
                encoding=args.encoding,
                chunk_size=args.chunk_size,
                start_offset=offset,
            ):
                if abort_request["stop"]:
                    completed_all = False
                    break

                future = pool.submit(hash_batch, batch)
                pending[future] = (next_offset, len(batch))

                if len(pending) >= max(1, args.prefetch):
                    done, _ = wait(pending.keys(), return_when=FIRST_COMPLETED)
                    for fut in done:
                        next_offset, hashed_count = handle_result(
                            fut,
                            pending,
                            redis_client,
                            args.kvrocks_prefix,
                            processed,
                            args.status_file,
                        )
                        processed += hashed_count
                        offset = next_offset

            # Flush remaining futures
            while pending:
                done, _ = wait(pending.keys(), return_when=FIRST_COMPLETED)
                for fut in done:
                    next_offset, hashed_count = handle_result(
                        fut,
                        pending,
                        redis_client,
                        args.kvrocks_prefix,
                        processed,
                        args.status_file,
                    )
                    processed += hashed_count
                    offset = next_offset

        except KeyboardInterrupt:
            abort_request["stop"] = True
            completed_all = False
        finally:
            if completed_all and not abort_request["stop"]:
                if args.status_file.exists():
                    try:
                        args.status_file.unlink()
                        print(
                            f"[+] Completed wordlist "
                            f"(processed={processed}); removed status file"
                        )
                    except OSError as exc:
                        print(
                            f"[!] Completed processing but failed to remove status file: {exc}",
                            file=sys.stderr,
                        )
                else:
                    print(f"[+] Completed wordlist (processed={processed})")
            else:
                write_status(args.status_file, offset, processed)
                print(f"[+] Saved progress at offset={offset}, processed={processed}")

    return 0


def handle_result(
    future,
    pending,
    redis_client: redis.Redis,
    redis_prefix: str,
    processed_so_far: int,
    status_path: Path,
) -> Tuple[int, int]:
    batch_offset, _ = pending.pop(future)
    hashed_entries = future.result()
    if hashed_entries:
        pipe = redis_client.pipeline()
        for digest, password in hashed_entries:
            redis_key = make_redis_key(redis_prefix, digest)
            pipe.set(redis_key, password)
        pipe.execute()
    processed_total = processed_so_far + len(hashed_entries)
    write_status(status_path, batch_offset, processed_total)
    print(
        f"[+] Stored {len(hashed_entries)} entries "
        f"(processed={processed_total}, offset={batch_offset})"
    )
    return batch_offset, len(hashed_entries)


if __name__ == "__main__":
    sys.exit(main())
