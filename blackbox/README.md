# Blackbox Analysis

This directory contains helpers for working with Betaflight and INAV Blackbox.


## Custom `bbox_decode.py`

The main decoder in this directory is a lightweight Python script that can:

- Quick overview of the blackbox data
- decode embedded Blackbox logs from a raw dump
- export per-log CSV files
- export GPS CSV files when GPS frames are present
- generate GPX tracks for mapping tools
- print log metadata in text or JSON form

Command help:

```bash
python3 blackbox/bbox_decode.py --help
```

```text
usage: bbox_decode.py [-h] [--json] [--onlygpx] [--info] input

Decode a Betaflight/INAV Blackbox file into CSV and GPX.

positional arguments:
  input       Path to the Blackbox file

options:
  -h, --help  show this help message and exit
  --json      Print log metadata as JSON on stdout
  --onlygpx   Generate only GPX files, skip CSV outputs
  --info      Print metadata plus the first and last GPS coordinates for each
              log
```

### Example: `--info`

Use `--info` for a quick overview of each embedded log without focusing on the
full CSV output.

```bash
python3 blackbox/bbox_decode.py --info blackbox/blackbox/bbox_eventfull.bin
```

Example output:

```text
[log 01]
Firmware revision:INAV 9.0.0 (a7932b92) SKYSTARSF405V2
Firmware date:Jan 14 2026 08:48:42
Log start datetime:2026-01-14T13:56:55.398+00:00
Arming Coord:36.1815787,117.0996749
Disarmed Coord:36.1816576,117.0997670
```

This mode is useful to quickly identify:

- firmware revision and build date
- log start timestamp
- arming and disarming GPS coordinates when GPS data is present

### Example: Standard Decode

Decode a dump and generate CSV and GPX outputs:

```bash
python3 blackbox/bbox_decode.py blackbox/blackbox/bbox_eventfull.bin
```

Example metadata output:

```text
[log 01]
Firmware revision:INAV 9.0.0 (a7932b92) SKYSTARSF405V2
Firmware date:Jan 14 2026 08:48:42
Log start datetime:2026-01-14T13:56:55.398+00:00
```

For a multi-log dump, the script prints one metadata block per embedded log and
creates files such as:

- `bbox_eventfull.bin.01.csv`
- `bbox_eventfull.bin.01.gps.csv`
- `bbox_eventfull.bin.01.gps.gpx`

### Example: JSON Metadata

To collect metadata programmatically:

```bash
python3 blackbox/bbox_decode.py --json blackbox/blackbox/bbox_eventfull.bin
```

Example JSON entry:

```json
{
  "log_index": 1,
  "firmware_revision": "INAV 9.0.0 (a7932b92) SKYSTARSF405V2",
  "firmware_date": "Jan 14 2026 08:48:42",
  "log_start_datetime": "2026-01-14T13:56:55.398+00:00"
}
```

### Example: GPX Only

To skip CSV generation and keep only GPS tracks:

```bash
python3 blackbox/bbox_decode.py --onlygpx blackbox/blackbox/bbox_eventfull.bin
```

Example output:

```text
[log 01]
Firmware revision:INAV 9.0.0 (a7932b92) SKYSTARSF405V2
Firmware date:Jan 14 2026 08:48:42
Log start datetime:2026-01-14T13:56:55.398+00:00
[log 02]
Firmware revision:INAV 9.0.0 (a7932b92) SKYSTARSF405V2
Firmware date:Jan 14 2026 08:48:42
Log start datetime:2026-01-14T14:08:17.180+00:00
```

Generated GPX files:

- `bbox_eventfull.bin.01.gps.gpx`
- `bbox_eventfull.bin.02.gps.gpx`
- `bbox_eventfull.bin.03.gps.gpx`

Example GPX content:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<gpx creator="Blackbox flight data recorder" version="1.1" xmlns="http://www.topografix.com/GPX/1/1">
<metadata><name>Blackbox flight log</name></metadata>
<trk><name>Blackbox flight log</name><trkseg>
  <trkpt lat="36.1815787" lon="117.0996749"><ele>1.89</ele><time>2026-01-14T14:00:04.137291Z</time></trkpt>
  <trkpt lat="36.1815787" lon="117.0996749"><ele>1.89</ele><time>2026-01-14T14:00:04.144874Z</time></trkpt>
```

### Example: CSV Output

For logs without GPS traces, the decoder still exports the main CSV:

```bash
python3 blackbox/bbox_decode.py blackbox/blackbox/bbox_eventless.bin
```

Example CSV header and first rows from `bbox_eventless.bin.01.csv`:

```csv
loopIteration,time,axisP[0],axisP[1],axisP[2],axisI[0],axisI[1],axisI[2],axisD[0],axisD[1],axisF[0],axisF[1],axisF[2],rcCommand[0],rcCommand[1],rcCommand[2],rcCommand[3],setpoint[0],setpoint[1],setpoint[2],setpoint[3],vbatLatest,amperageLatest,rssi,gyroADC[0],gyroADC[1],gyroADC[2],accSmooth[0],accSmooth[1],accSmooth[2],debug[0],debug[1],debug[2],debug[3],motor[0],motor[1],motor[2],motor[3],flightModeFlags,stateFlags,failsafePhase,rxSignalReceived,rxFlightChannelsValid
0,21243916,7,4,-4,0,0,0,16,15,0,0,0,1,1,-1,1000,0,0,0,0,2278,162,556,-3,-2,1,-96,109,2028,8,8,-2,0,246,158,316,260,,,,,
1,21244420,5,6,-4,0,0,0,13,24,0,0,0,1,1,-1,1000,0,0,0,0,2278,162,556,-2,-3,1,-96,109,2028,2,4,-1,0,287,158,338,238,ANGLE_MODE,0,IDLE,1,1
2,21244916,2,6,-3,0,0,0,3,26,0,0,0,1,1,-1,1000,0,0,0,0,2278,162,556,-2,-4,0,-108,108,2031,-6,-3,-1,0,290,158,300,192,ANGLE_MODE,0,IDLE,1,1
```

### Notes

- A single blackbox dump may contain multiple embedded logs.
- Output files are written next to the input file.
- If no GPS frames are found for a log, no GPX file is generated for that log.
- `--onlygpx` skips CSV creation but still parses the log metadata.


## Usage With Official Betaflight Tools

Blackbox Explorer and the related tools are available here:

https://github.com/betaflight/blackbox-tools

Example:

```bash
../blackbox-tools/obj/blackbox_decode ./blackbox/blackbox_full.bin --debug
```

Example output:

```text
Decoding log 'blackbox.bin' to 'blackbox.01.csv'...
Data file contained no events

Log 1 of 6, start 00:21.243, end 01:15.041, duration 00:53.797

Statistics
Looptime            491 avg           61.7 std dev (12.6%)
I frames    1684   56.7 bytes avg    95419 bytes total
P frames  105976   28.3 bytes avg  3003159 bytes total
E frames       2    8.5 bytes avg       17 bytes total
S frames       8    3.0 bytes avg       24 bytes total
Frames    107660   28.8 bytes avg  3098578 bytes total
Data rate 2001Hz  59724 bytes/s     597300 baud
```

## FeedBack
 - Please send us any exotic BlackBox unsupported or where the extraction did not succeed.

## Author and License

This tooling is developed by CIRCL Luxembourg www.circl.lu.

This project is licensed under the GNU Affero General Public License v3.0
(AGPL-3.0). See the repository [`LICENSE`](../LICENSE) file for details.
