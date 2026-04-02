# Flight Controller Firmware Analysis

This directory contains tools for analyzing flight controller firmware dumps.

Supported targets:

- Betaflight
- INAV
- ArduPilot (partial support)

## Overview

Many DIY and commercial drones use STM32-based flight controllers, most often
from the STM32F4 and STM32F7 families. Because each board can use a different
memory layout and flash size, the controller model must be identified before
extracting configuration data from a dump.

The workflow provided here helps you:

1. Identify the flight controller operating system.
2. Identify the target platform and microcontroller.
3. Extract the configuration area from the memory dump.
4. Decode the extracted configuration.

Currently, the tooling can recover:

- Craft name
- Pilot name
- Saved waypoints

Additionally it is possible to extract the serial number of the STM32 Chip by using
a ST-LINK programmer directly on the STM32

```bash
$ ./get_stm_uid.py f722
Chip        : STM32F722
UID address : 0x1FF07A10
UID bytes   : 2B 00 49 00 0F 51 33 34 37 38 39 32
mcu_id      : 0x49002b3433510f32393837
```

## YARA Rules

The YARA rules are stored in [`fc/yara/`](./yara).

- `drones_operating.yara`: identify the FC firmware family
- `drones_inav_firmwares.yara`: identify INAV targets and chipsets
- `drones_betaflight_firmwares.yara`: identify Betaflight targets and chipsets
- `drones_ardupilot_firmwares.yara`: identify ArduPilot targets and chipsets

## Example Workflow

The commands below are intended to be run from the repository root.

### 1. Determine the operating system

Use the operating system detection rule:

```bash
yr scan fc/yara/drones_operating.yara fc/samples/sample_01.dump --output-format json
```

Example output:

```json
{
  "version": "1.14.0",
  "matches": [
    {
      "rule": "INAV_FC",
      "file": "/home/thanat0s/Forensic/drones/Drone-Forensic/fc/samples/sample_01.dump"
    }
  ]
}
```

This sample matches `INAV_FC`, so the dump comes from an INAV-based flight
controller.

### 2. Determine the microcontroller model and target

Use the INAV firmware rule set:

```bash
yr scan fc/yara/drones_inav_firmwares.yara fc/samples/sample_01.dump --output-format json -m
```

Example output:

```json
{
  "version": "1.14.0",
  "matches": [
    {
      "rule": "DAKEFPVF722_STM32F722",
      "file": "/home/thanat0s/Forensic/drones/Drone-Forensic/fc/samples/sample_01.dump",
      "meta": {
        "target": "DAKEFPVF722",
        "detection_source": "inav-target",
        "chipset": "STM32F722",
        "build_macro": "target_stm32f722xe"
      }
    },
    {
      "rule": "SITL_SITL",
      "file": "/home/thanat0s/Forensic/drones/Drone-Forensic/fc/samples/sample_01.dump",
      "meta": {
        "build_macro": "target_sitl",
        "target": "SITL",
        "chipset": "SITL",
        "detection_source": "inav-target"
      }
    }
  ]
}
```

In this case, the relevant match is `STM32F722`, so the dump belongs to an
INAV flight controller running on an STM32F7-family MCU.

### 3. Extract the configuration block

Extract the `FLASH_CONFIG` region from the dump:

```bash
python3 fc/src/inav_extract_flash.py -o /tmp/fc_flash.bin fc/samples/sample_01.dump f722
```

Example output:

```text
Wrote 16384 bytes from 0x08004000 to /tmp/fc_flash.bin (offset 0x4000 within the dump)
```

To see the supported hardware identifiers:

```bash
python3 fc/src/inav_extract_flash.py --list
```

### 4. Decode the extracted configuration

Decode the extracted block:

```bash
python3 fc/src/inav_dump_config.py /tmp/fc_flash.bin
```

Example output:

```text
Results:
  Craft name    : MK2
  Pilot name    : VIKTOR
  MD5           : 588de5b6b6c3d5b130d0c44ab0d9f807
  SHA256        : 1643a2125ff0f1ecfc7ffaafb3296247a109b1dd19cd9bce7f4b5872803eee37
  Waypoint count: 15
  GPX export    : waypoints.gpx
```

## Notes

- Different controllers may require different extraction parameters.
- Some platforms are only partially supported.
- depending of the detected flight controller use inav_something or beta_something. 
- For config dumper, use `--verbose` or `--json` for a more detailed debug or report.

## fEEDBACk
 - Please send us any exotic Firmware unsupported or where the extraction did not succeed.

## Author and License

This tooling is developed by CIRCL Luxembourg www.circl.lu.

This project is licensed under the GNU Affero General Public License v3.0
(AGPL-3.0). See the repository [`LICENSE`](../LICENSE) file for details.
