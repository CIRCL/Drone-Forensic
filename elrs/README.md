# ELRS Tools

This directory contains ExpressLRS-related helpers located in `elrs/src/`.

Theses scripts allows to manipulate ELRS UID 
and also to extract interesting values from ELRS TX/RX dumps
- `uid`
- `wifi-ssid`
- `wifi-password`

## How a UID is computed from the binding phrase

An ELRS UID is:

```text
md5('-DMY_BINDING_PHRASE="{bind_phrase}"')[:6]
```
The first 6 bytes of the MD5 digest are used as the ELRS UID.

## Available Tools

### `dump_elrs.py`

Extract valid JSON fragments from a raw binary blob and report ELRS-relevant
fields such as:

- `uid`
- `wifi-ssid`
- `wifi-password`

Example:

```bash
python3 elrs/src/dump_elrs.py firmware_dump.bin
```

JSON output mode:

```bash
python3 elrs/src/dump_elrs.py --json firmware_dump.bin
```

The JSON output includes:

- `md5`
- `sha256`
- extracted ELRS-related configuration values

### `elrs_uid.py`

Compute the ELRS UID from a binding phrase.

Example:

```bash
python3 elrs/src/elrs_uid.py
```

The script prompts for the binding phrase and prints:

- UID bytes in decimal
- UID bytes in hexadecimal

### `elrs_rainbow.py`

Look up a binding phrase from a known 6-byte ELRS UID using a kvrocks-backed
rainbow table.

Requirements:

- Python dependency: `redis`
- access to a kvrocks instance containing the ELRS rainbow table

Example:

```bash
python3 elrs/src/elrs_rainbow.py 12,34,56,78,90,12
```

Default kvrocks settings used by the script:

- host: `127.0.0.1`
- port: `6666`
- database: `5`
- key prefix: `elrs_rainbow`

### `elrs_do_rainbow.py`

Generate a rainbow table from a wordlist and store it in kvrocks.

Features:

- hashes binding phrases in parallel
- stores the first 6 MD5 bytes as uppercase hex keys
- supports resume through a status file

Requirements:

- Python dependency: `redis`
- a running kvrocks instance

Example:

```bash
python3 elrs/src/elrs_do_rainbow.py rockyou.txt
```

Useful options supported by the script:

- `--status-file` to control resume state storage
- `--chunk-size` to tune batching
- `--processes` to tune parallel workers
- `--prefetch` to tune queued jobs

## Installation

If you want to use `elrs_rainbow.py` or `elrs_do_rainbow.py`, install the
required Python dependency with:

```bash
pip install -r elrs/src/requirements.txt
```

Current Python dependency:

```text
redis
```

## Notes

- `elrs_uid.py` is standalone and only uses the Python standard library.
- `elrs_rainbow.py` and `elrs_do_rainbow.py` require the `redis` Python package.
- The rainbow-table workflow assumes kvrocks is used as the backing key-value store.

## FeedBack

- Please send us any exotic Firmware unsupported or where the extraction did not succeed.

## Author and License

This tooling is developed by CIRCL Luxembourg www.circl.lu.

This project is licensed under the GNU Affero General Public License v3.0
(AGPL-3.0). See the repository [`LICENSE`](../LICENSE) file for details.
