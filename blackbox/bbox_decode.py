#!/usr/bin/env python3
"""Decode Betaflight/INAV Blackbox dumps into CSV and GPX."""
from __future__ import annotations

import argparse
import csv
import hashlib
import json
from dataclasses import dataclass, field
from datetime import datetime, timedelta, timezone
from pathlib import Path


FRAME_MARKERS = {ord("I"), ord("P"), ord("S"), ord("G"), ord("H"), ord("E")}

PREDICTOR_0 = 0
PREDICTOR_PREVIOUS = 1
PREDICTOR_STRAIGHT_LINE = 2
PREDICTOR_AVERAGE_2 = 3
PREDICTOR_MINTHROTTLE = 4
PREDICTOR_MOTOR_0 = 5
PREDICTOR_INC = 6
PREDICTOR_HOME_COORD = 7
PREDICTOR_1500 = 8
PREDICTOR_VBATREF = 9
PREDICTOR_LAST_MAIN_FRAME_TIME = 10
PREDICTOR_MINMOTOR = 11
PREDICTOR_HOME_COORD_1 = 256

ENCODING_SIGNED_VB = 0
ENCODING_UNSIGNED_VB = 1
ENCODING_NEG_14BIT = 3
ENCODING_ELIAS_DELTA_U32 = 4
ENCODING_ELIAS_DELTA_S32 = 5
ENCODING_TAG8_8SVB = 6
ENCODING_TAG2_3S32 = 7
ENCODING_TAG8_4S16 = 8
ENCODING_NULL = 9
ENCODING_ELIAS_GAMMA_U32 = 10
ENCODING_ELIAS_GAMMA_S32 = 11

FLIGHT_MODE_NAMES = [
    "ANGLE_MODE",
    "HORIZON_MODE",
    "MAG",
    "BARO",
    "GPS_HOME",
    "GPS_HOLD",
    "HEADFREE",
    "UNUSED",
    "PASSTHRU",
    "RANGEFINDER_MODE",
    "FAILSAFE_MODE",
]

STATE_FLAG_NAMES = [
    "GPS_FIX_HOME",
    "GPS_FIX",
    "CALIBRATE_MAG",
    "SMALL_ANGLE",
    "FIXED_WING",
]

FAILSAFE_PHASE_NAMES = [
    "IDLE",
    "RX_LOSS_DETECTED",
    "LANDING",
    "LANDED",
    "FAILSAFE_RX_LOSS_MONITORING",
    "FAILSAFE_RX_LOSS_RECOVERED",
]


def zigzag_decode(value: int) -> int:
    """Decode a ZigZag-encoded signed integer."""
    return (value >> 1) ^ -(value & 1)


def sign_extend(value: int, bits: int) -> int:
    """Sign-extend ``value`` interpreted on ``bits`` bits."""
    sign_bit = 1 << (bits - 1)
    return (value & (sign_bit - 1)) - (value & sign_bit)


class ByteReader:
    """Read bytes and bit-packed values from a Blackbox payload slice."""
    __slots__ = ("data", "pos", "end", "bit_pos")

    def __init__(self, data: bytes, offset: int, end: int):
        """Initialise a reader over ``data[offset:end]``."""
        self.data = data
        self.pos = offset
        self.end = end
        self.bit_pos = 7

    def eof(self) -> bool:
        """Return whether the reader reached the end of the slice."""
        return self.pos >= self.end

    def peek_byte(self) -> int | None:
        """Return the next byte without consuming it."""
        if self.pos >= self.end:
            return None
        return self.data[self.pos]

    def read_byte(self) -> int:
        """Read one byte from the payload slice."""
        if self.pos >= self.end:
            raise EOFError("unexpected end of payload")
        value = self.data[self.pos]
        self.pos += 1
        return value

    def byte_align(self) -> None:
        """Advance to the next byte boundary when reading bitstreams."""
        if self.bit_pos != 7:
            self.bit_pos = 7
            self.pos += 1

    def read_bits(self, num_bits: int) -> int:
        """Read ``num_bits`` bits in MSB-first order."""
        result = 0
        for _ in range(num_bits):
            if self.pos >= self.end:
                raise EOFError("unexpected end of bitstream")
            result <<= 1
            result |= (self.data[self.pos] >> self.bit_pos) & 1
            if self.bit_pos == 0:
                self.pos += 1
                self.bit_pos = 7
            else:
                self.bit_pos -= 1
        return result

    def read_bit(self) -> int:
        """Read a single bit from the current bitstream position."""
        return self.read_bits(1)

    def read_unsigned_vb(self) -> int:
        """Read an unsigned variable-byte encoded integer."""
        result = 0
        shift = 0
        for _ in range(5):
            c = self.read_byte()
            result |= (c & 0x7F) << shift
            if c < 0x80:
                return result
            shift += 7
        raise ValueError("invalid unsigned varbyte")

    def read_signed_vb(self) -> int:
        """Read a ZigZag + variable-byte encoded signed integer."""
        return zigzag_decode(self.read_unsigned_vb())

    def read_elias_delta_u32(self) -> int:
        """Read an unsigned Elias-Delta encoded 32-bit integer."""
        length_val_bits = 0
        while length_val_bits <= 32 and self.read_bit() == 0:
            length_val_bits += 1
        if length_val_bits > 32:
            raise ValueError("invalid Elias-Delta value")
        length_low_bits = self.read_bits(length_val_bits) if length_val_bits else 0
        length = ((1 << length_val_bits) | length_low_bits) - 1
        if length > 32:
            raise ValueError("invalid Elias-Delta length")
        result_low_bits = self.read_bits(length) if length else 0
        result = (1 << length) | result_low_bits
        if result == 0xFFFFFFFF:
            escape = self.read_bit()
            return 0xFFFFFFFF - 1 if escape == 0 else 0xFFFFFFFF
        return result - 1

    def read_elias_delta_s32(self) -> int:
        """Read a signed Elias-Delta encoded 32-bit integer."""
        return zigzag_decode(self.read_elias_delta_u32())

    def read_elias_gamma_u32(self) -> int:
        """Read an unsigned Elias-Gamma encoded 32-bit integer."""
        val_bits = 0
        while val_bits <= 32 and self.read_bit() == 0:
            val_bits += 1
        if val_bits > 32:
            raise ValueError("invalid Elias-Gamma value")
        value_low_bits = self.read_bits(val_bits - 1) if val_bits > 1 else 0
        result = (1 << (val_bits - 1)) | value_low_bits
        if result == 0xFFFFFFFF:
            escape = self.read_bit()
            return 0xFFFFFFFF - 1 if escape == 0 else 0xFFFFFFFF
        return result - 1

    def read_elias_gamma_s32(self) -> int:
        """Read a signed Elias-Gamma encoded 32-bit integer."""
        return zigzag_decode(self.read_elias_gamma_u32())

    def read_tag2_3s32(self) -> list[int]:
        """Read a TAG2_3S32 packed group of three signed values."""
        lead = self.read_byte()
        mode = lead >> 6
        if mode == 0:
            return [
                sign_extend((lead >> 4) & 0x03, 2),
                sign_extend((lead >> 2) & 0x03, 2),
                sign_extend(lead & 0x03, 2),
            ]
        if mode == 1:
            lead2 = self.read_byte()
            return [
                sign_extend(lead & 0x0F, 4),
                sign_extend(lead2 >> 4, 4),
                sign_extend(lead2 & 0x0F, 4),
            ]
        if mode == 2:
            return [
                sign_extend(lead & 0x3F, 6),
                sign_extend(self.read_byte() & 0x3F, 6),
                sign_extend(self.read_byte() & 0x3F, 6),
            ]

        values: list[int] = []
        selector = lead
        for _ in range(3):
            size_code = selector & 0x03
            if size_code == 0:
                values.append(sign_extend(self.read_byte(), 8))
            elif size_code == 1:
                lo = self.read_byte()
                hi = self.read_byte()
                values.append(sign_extend(lo | (hi << 8), 16))
            elif size_code == 2:
                b1 = self.read_byte()
                b2 = self.read_byte()
                b3 = self.read_byte()
                values.append(sign_extend(b1 | (b2 << 8) | (b3 << 16), 24))
            else:
                b1 = self.read_byte()
                b2 = self.read_byte()
                b3 = self.read_byte()
                b4 = self.read_byte()
                values.append(sign_extend(b1 | (b2 << 8) | (b3 << 16) | (b4 << 24), 32))
            selector >>= 2
        return values

    def read_tag8_4s16_v2(self) -> list[int]:
        """Read a TAG8_4S16 v2 packed group of four signed values."""
        selector = self.read_byte()
        nibble_index = 0
        buffer = 0
        values: list[int] = []
        for _ in range(4):
            field_type = selector & 0x03
            if field_type == 0:
                values.append(0)
            elif field_type == 1:
                if nibble_index == 0:
                    buffer = self.read_byte()
                    values.append(sign_extend(buffer >> 4, 4))
                    nibble_index = 1
                else:
                    values.append(sign_extend(buffer & 0x0F, 4))
                    nibble_index = 0
            elif field_type == 2:
                if nibble_index == 0:
                    values.append(sign_extend(self.read_byte(), 8))
                else:
                    char1 = (buffer << 4) & 0xF0
                    buffer = self.read_byte()
                    char1 |= buffer >> 4
                    values.append(sign_extend(char1, 8))
            else:
                if nibble_index == 0:
                    char1 = self.read_byte()
                    char2 = self.read_byte()
                    values.append(sign_extend((char1 << 8) | char2, 16))
                else:
                    char1 = self.read_byte()
                    char2 = self.read_byte()
                    values.append(
                        sign_extend((buffer << 12) | (char1 << 4) | (char2 >> 4), 16)
                    )
                    buffer = char2
            selector >>= 2
        return values

    def read_tag8_8svb(self, count: int) -> list[int]:
        """Read a TAG8_8SVB packed group of up to eight signed values."""
        if count == 1:
            return [self.read_signed_vb()]
        header = self.read_byte()
        values: list[int] = []
        for _ in range(count):
            if header & 0x01:
                values.append(self.read_signed_vb())
            else:
                values.append(0)
            header >>= 1
        return values


@dataclass(slots=True)
class FrameDef:
    """Field definition block extracted from the Blackbox header."""
    names: list[str] = field(default_factory=list)
    signed: list[int] = field(default_factory=list)
    predictor: list[int] = field(default_factory=list)
    encoding: list[int] = field(default_factory=list)


@dataclass(slots=True)
class LogConfig:
    """Subset of header configuration needed during decoding and reporting."""
    minthrottle: int = 1150
    vbatref: int = 4095
    motor_output_low: int = 1150
    frame_interval_i: int = 32
    frame_interval_p_num: int = 1
    frame_interval_p_denom: int = 1
    log_start_dt: datetime | None = None
    firmware_revision: str = ""
    firmware_date: str = ""
    board_information: str = ""
    log_start_datetime_raw: str = ""
    craft_name: str = ""


@dataclass(slots=True)
class LogContext:
    """Runtime state and cached field indexes for one decoded log."""
    frame_defs: dict[str, FrameDef]
    config: LogConfig
    last_main: list[int] | None = None
    last_main2: list[int] | None = None
    last_main_iteration: int | None = None
    last_main_time: int | None = None
    last_slow: list[int] | None = None
    last_gps: list[int] | None = None
    gps_home: list[int] | None = None
    main_time_index: int = -1
    main_motor0_index: int = -1
    slow_flight_mode_index: int = -1
    slow_state_flags_index: int = -1
    slow_failsafe_index: int = -1
    gps_time_index: int = -1
    gps_coord_index_0: int = -1
    gps_coord_index_1: int = -1
    gps_altitude_index: int = -1
    gps_speed_index: int = -1
    gps_ground_course_index: int = -1

    def __post_init__(self) -> None:
        """Cache frequently used field indexes for faster decoding."""
        idef = self.frame_defs.get("I")
        if idef:
            name_to_index = {name: idx for idx, name in enumerate(idef.names)}
            self.main_time_index = name_to_index.get("time", -1)
            self.main_motor0_index = name_to_index.get("motor[0]", -1)

        sdef = self.frame_defs.get("S")
        if sdef:
            name_to_index = {name: idx for idx, name in enumerate(sdef.names)}
            self.slow_flight_mode_index = name_to_index.get("flightModeFlags", -1)
            self.slow_state_flags_index = name_to_index.get("stateFlags", -1)
            self.slow_failsafe_index = name_to_index.get("failsafePhase", -1)

        gdef = self.frame_defs.get("G")
        if gdef:
            name_to_index = {name: idx for idx, name in enumerate(gdef.names)}
            self.gps_time_index = name_to_index.get("time", -1)
            self.gps_coord_index_0 = name_to_index.get("GPS_coord[0]", -1)
            self.gps_coord_index_1 = name_to_index.get("GPS_coord[1]", -1)
            self.gps_altitude_index = name_to_index.get("GPS_altitude", -1)
            self.gps_speed_index = name_to_index.get("GPS_speed", -1)
            self.gps_ground_course_index = name_to_index.get("GPS_ground_course", -1)


def parse_csv_ints(value: str) -> list[int]:
    """Parse a comma-separated integer list from a header field."""
    if not value:
        return []
    return [int(part) for part in value.split(",")]


def parse_header(
    data: bytes, offset: int
) -> tuple[dict[str, FrameDef], LogConfig, int]:
    """Parse one Blackbox ASCII header and return its frame definitions."""
    pos = offset
    frame_defs: dict[str, FrameDef] = {}
    config = LogConfig()

    while data[pos : pos + 2] == b"H ":
        end = data.find(b"\n", pos)
        if end == -1:
            raise ValueError("unterminated header line")
        line = data[pos + 2 : end].decode("utf-8", "replace").rstrip("\r")
        pos = end + 1

        if ":" not in line:
            continue
        key, value = line.split(":", 1)
        value = value.strip()

        if key.startswith("Field "):
            _, frame_type, attr = key.split(" ", 2)
            frame_def = frame_defs.setdefault(frame_type, FrameDef())
            if attr == "name":
                frame_def.names = value.split(",") if value else []
            elif attr == "signed":
                frame_def.signed = parse_csv_ints(value)
            elif attr == "predictor":
                frame_def.predictor = parse_csv_ints(value)
            elif attr == "encoding":
                frame_def.encoding = parse_csv_ints(value)
        elif key == "I interval":
            config.frame_interval_i = int(value)
        elif key == "P interval":
            if "/" in value:
                num, denom = value.split("/", 1)
                config.frame_interval_p_num = int(num)
                config.frame_interval_p_denom = int(denom)
            else:
                config.frame_interval_p_num = int(value)
                config.frame_interval_p_denom = 1
        elif key == "minthrottle":
            config.minthrottle = int(value)
        elif key == "motorOutput":
            low, *_rest = value.split(",")
            config.motor_output_low = int(low)
        elif key == "vbatref":
            config.vbatref = int(value)
        elif key == "Firmware revision":
            config.firmware_revision = value
        elif key == "Firmware date":
            config.firmware_date = value
        elif key == "Board information":
            config.board_information = value
        elif key == "Log start datetime":
            config.log_start_datetime_raw = value
            try:
                parsed = datetime.fromisoformat(value)
            except ValueError:
                parsed = None
            if parsed is not None:
                config.log_start_dt = (
                    parsed if parsed.tzinfo else parsed.replace(tzinfo=timezone.utc)
                )
        elif key == "Craft name":
            config.craft_name = value

    gdef = frame_defs.get("G")
    if gdef:
        for idx in range(1, len(gdef.predictor)):
            if (
                gdef.predictor[idx - 1] == PREDICTOR_HOME_COORD
                and gdef.predictor[idx] == PREDICTOR_HOME_COORD
            ):
                gdef.predictor[idx] = PREDICTOR_HOME_COORD_1

    if "I" in frame_defs and "P" in frame_defs:
        if not frame_defs["P"].names:
            frame_defs["P"].names = list(frame_defs["I"].names)
        if not frame_defs["P"].signed:
            frame_defs["P"].signed = list(frame_defs["I"].signed)

    return frame_defs, config, pos


def should_have_frame(config: LogConfig, frame_index: int) -> bool:
    """Return whether a main-frame iteration should be logged."""
    return (
        (frame_index % config.frame_interval_i) + config.frame_interval_p_num - 1
    ) % config.frame_interval_p_denom < config.frame_interval_p_num


def count_intentionally_skipped_frames(ctx: LogContext) -> int:
    """Count skipped main-frame iterations between two logged frames."""
    if ctx.last_main_iteration is None:
        return 0
    count = 0
    frame_index = ctx.last_main_iteration + 1
    while not should_have_frame(ctx.config, frame_index):
        count += 1
        frame_index += 1
    return count


def apply_prediction(
    ctx: LogContext,
    frame_type: str,
    field_index: int,
    predictor: int,
    value: int,
    current: list[int],
    previous: list[int] | None,
    previous2: list[int] | None,
) -> int:
    """Apply the predictor associated with one decoded field value."""
    if predictor == PREDICTOR_0:
        return value
    if predictor == PREDICTOR_MINTHROTTLE:
        return value + ctx.config.minthrottle
    if predictor == PREDICTOR_1500:
        return value + 1500
    if predictor == PREDICTOR_MOTOR_0:
        motor0_index = ctx.main_motor0_index
        return value + (current[motor0_index] if motor0_index >= 0 else 0)
    if predictor == PREDICTOR_VBATREF:
        return value + ctx.config.vbatref
    if predictor == PREDICTOR_PREVIOUS:
        return value + (previous[field_index] if previous else 0)
    if predictor == PREDICTOR_STRAIGHT_LINE:
        if previous and previous2:
            return value + 2 * previous[field_index] - previous2[field_index]
        return value
    if predictor == PREDICTOR_AVERAGE_2:
        if previous and previous2:
            return value + (previous[field_index] + previous2[field_index]) // 2
        return value
    if predictor == PREDICTOR_HOME_COORD:
        return value + (ctx.gps_home[0] if ctx.gps_home else 0)
    if predictor == PREDICTOR_HOME_COORD_1:
        return value + (
            ctx.gps_home[1] if ctx.gps_home and len(ctx.gps_home) > 1 else 0
        )
    if predictor == PREDICTOR_LAST_MAIN_FRAME_TIME:
        return value + (ctx.last_main_time or 0)
    if predictor == PREDICTOR_MINMOTOR:
        return value + ctx.config.motor_output_low
    raise ValueError(f"unsupported predictor {predictor} in {frame_type} frame")


def decode_frame(
    ctx: LogContext,
    reader: ByteReader,
    frame_type: str,
    previous: list[int] | None,
    previous2: list[int] | None,
    skipped_frames: int,
) -> list[int]:
    """Decode one Blackbox frame payload using its field definition."""
    frame_def = ctx.frame_defs[frame_type]
    predictor_arr = frame_def.predictor
    encoding_arr = frame_def.encoding
    field_count = len(predictor_arr)
    current = [0] * field_count
    i = 0
    read_signed_vb = reader.read_signed_vb
    read_unsigned_vb = reader.read_unsigned_vb
    read_elias_delta_u32 = reader.read_elias_delta_u32
    read_elias_delta_s32 = reader.read_elias_delta_s32
    read_elias_gamma_u32 = reader.read_elias_gamma_u32
    read_elias_gamma_s32 = reader.read_elias_gamma_s32
    read_tag8_4s16_v2 = reader.read_tag8_4s16_v2
    read_tag2_3s32 = reader.read_tag2_3s32
    read_tag8_8svb = reader.read_tag8_8svb
    byte_align = reader.byte_align
    apply_pred = apply_prediction

    while i < field_count:
        predictor = predictor_arr[i]
        encoding = encoding_arr[i]

        if predictor == PREDICTOR_INC:
            current[i] = (previous[i] if previous else 0) + skipped_frames + 1
            i += 1
            continue

        byte_align()

        if encoding == ENCODING_SIGNED_VB:
            value = read_signed_vb()
        elif encoding == ENCODING_UNSIGNED_VB:
            value = read_unsigned_vb()
        elif encoding == ENCODING_NEG_14BIT:
            value = -sign_extend(read_unsigned_vb(), 14)
        elif encoding == ENCODING_TAG8_4S16:
            values = read_tag8_4s16_v2()
            for j, raw in enumerate(values):
                idx = i + j
                current[idx] = apply_pred(
                    ctx,
                    frame_type,
                    idx,
                    predictor_arr[idx],
                    raw,
                    current,
                    previous,
                    previous2,
                )
            i += 4
            continue
        elif encoding == ENCODING_TAG2_3S32:
            values = read_tag2_3s32()
            for j, raw in enumerate(values):
                idx = i + j
                current[idx] = apply_pred(
                    ctx,
                    frame_type,
                    idx,
                    predictor_arr[idx],
                    raw,
                    current,
                    previous,
                    previous2,
                )
            i += 3
            continue
        elif encoding == ENCODING_TAG8_8SVB:
            group_count = 1
            while (
                i + group_count < field_count
                and group_count < 8
                and encoding_arr[i + group_count] == ENCODING_TAG8_8SVB
            ):
                group_count += 1
            values = read_tag8_8svb(group_count)
            for j, raw in enumerate(values):
                idx = i + j
                current[idx] = apply_pred(
                    ctx,
                    frame_type,
                    idx,
                    predictor_arr[idx],
                    raw,
                    current,
                    previous,
                    previous2,
                )
            i += group_count
            continue
        elif encoding == ENCODING_ELIAS_DELTA_U32:
            value = read_elias_delta_u32()
        elif encoding == ENCODING_ELIAS_DELTA_S32:
            value = read_elias_delta_s32()
        elif encoding == ENCODING_ELIAS_GAMMA_U32:
            value = read_elias_gamma_u32()
        elif encoding == ENCODING_ELIAS_GAMMA_S32:
            value = read_elias_gamma_s32()
        elif encoding == ENCODING_NULL:
            value = 0
        else:
            raise ValueError(f"unsupported encoding {encoding} in {frame_type} frame")

        current[i] = apply_pred(
            ctx, frame_type, i, predictor, value, current, previous, previous2
        )
        i += 1

    byte_align()
    return current


def decode_flags(value: int, names: list[str]) -> str:
    """Render a bitfield as a pipe-separated flag string."""
    selected = [name for index, name in enumerate(names) if value & (1 << index)]
    return "|".join(selected) if selected else "0"


def decode_enum(value: int, names: list[str]) -> str:
    """Render an enum value using its symbolic name when available."""
    return names[value] if 0 <= value < len(names) else str(value)


def gpx_timestamp(base: datetime | None, micros: int) -> str | None:
    """Convert a microsecond counter into an RFC3339 UTC timestamp."""
    if base is None:
        return None
    stamp = base + timedelta(microseconds=micros)
    return (
        stamp.astimezone(timezone.utc)
        .isoformat(timespec="microseconds")
        .replace("+00:00", "Z")
    )


def format_main_row(
    ctx: LogContext, frame: list[int], slow_values: list[int] | list[str]
) -> list[str]:
    """Format one main-frame row for CSV output."""
    row = [str(value) for value in frame]
    if ctx.slow_flight_mode_index >= 0 and slow_values and slow_values[0] != "":
        row.extend(str(value) for value in slow_values)
        row[len(frame) + ctx.slow_flight_mode_index] = decode_flags(
            int(slow_values[ctx.slow_flight_mode_index]), FLIGHT_MODE_NAMES
        )
        if ctx.slow_state_flags_index >= 0:
            row[len(frame) + ctx.slow_state_flags_index] = decode_flags(
                int(slow_values[ctx.slow_state_flags_index]), STATE_FLAG_NAMES
            )
        if ctx.slow_failsafe_index >= 0:
            row[len(frame) + ctx.slow_failsafe_index] = decode_enum(
                int(slow_values[ctx.slow_failsafe_index]), FAILSAFE_PHASE_NAMES
            )
        return row
    row.extend("" if value == "" else str(value) for value in slow_values)
    return row


def format_gps_row(ctx: LogContext, frame: list[int]) -> list[str]:
    """Format one GPS frame row for CSV output."""
    row = [str(frame[0])]
    for idx, value in enumerate(frame[1:], start=1):
        if idx == ctx.gps_coord_index_0 or idx == ctx.gps_coord_index_1:
            row.append(f"{value / 10000000:.7f}")
        elif idx == ctx.gps_speed_index:
            row.append(f"{value / 100:.2f}")
        elif idx == ctx.gps_ground_course_index:
            row.append(f"{value / 10:.1f}")
        else:
            row.append(str(value))
    return row


def write_gpx(path: Path, points: list[dict[str, str]]) -> None:
    """Write a minimal GPX track file from decoded GPS points."""
    with path.open("w", encoding="utf-8", newline="") as handle:
        handle.write('<?xml version="1.0" encoding="UTF-8"?>\n')
        handle.write(
            '<gpx creator="Blackbox flight data recorder" version="1.1" xmlns="http://www.topografix.com/GPX/1/1" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.topografix.com/GPX/1/1 http://www.topografix.com/GPX/1/1/gpx.xsd">\n'
        )
        handle.write("<metadata><name>Blackbox flight log</name></metadata>\n")
        handle.write("<trk><name>Blackbox flight log</name><trkseg>\n")
        for point in points:
            handle.write(
                f'  <trkpt lat="{point["lat"]}" lon="{point["lon"]}"><ele>{point["ele"]}</ele>'
            )
            if point["time"]:
                handle.write(f'<time>{point["time"]}</time>')
            handle.write("</trkpt>\n")
        handle.write("</trkseg></trk>\n")
        handle.write("</gpx>")


def build_log_metadata(log_index: int, config: LogConfig) -> dict[str, object]:
    """Build the metadata object exposed in JSON mode."""
    raw_log_start = config.log_start_datetime_raw
    if raw_log_start.startswith("0000-"):
        raw_log_start = ""
    fields = {
        "firmware_revision": config.firmware_revision,
        "firmware_date": config.firmware_date,
        "board_information": config.board_information,
        "log_start_datetime": raw_log_start,
        "craft_name": config.craft_name,
    }
    metadata: dict[str, object] = {"log_index": log_index}
    for key, value in fields.items():
        if value:
            metadata[key] = value
    return metadata


def add_gps_info_metadata(
    metadata: dict[str, object],
    first_point: dict[str, str] | None,
    last_point: dict[str, str] | None,
) -> None:
    """Attach first and last GPS coordinates to one metadata entry."""
    metadata["has_gps"] = first_point is not None and last_point is not None
    if first_point is None or last_point is None:
        metadata["arming_coord"] = None
        metadata["disarmed_coord"] = None
        return
    metadata["arming_coord"] = {
        "lat": first_point["lat"],
        "lon": first_point["lon"],
    }
    metadata["disarmed_coord"] = {
        "lat": last_point["lat"],
        "lon": last_point["lon"],
    }


def print_log_metadata(log_index: int, config: LogConfig) -> None:
    """Print human-readable metadata for one log."""
    raw_log_start = config.log_start_datetime_raw
    no_time_info = raw_log_start.startswith("0000-")
    if no_time_info:
        raw_log_start = ""
    fields = [
        ("Firmware revision", config.firmware_revision),
        ("Firmware date", config.firmware_date),
        ("Board information", config.board_information),
        ("Log start datetime", raw_log_start),
        ("Craft name", config.craft_name),
    ]
    printed = False
    for key, value in fields:
        if value:
            if not printed:
                print(f"[log {log_index:02d}]")
                printed = True
            print(f"{key}:{value}")
    if no_time_info:
        if not printed:
            print(f"[log {log_index:02d}]")
        print("No time informations")


def print_no_gps_traces(json_output: bool) -> None:
    """Print the no-GPS message in text mode only."""
    if not json_output:
        print("No Gps informations")


def print_gps_info(
    json_output: bool, first_point: dict[str, str] | None, last_point: dict[str, str] | None
) -> None:
    """Print the first and last GPS points for one log in text mode."""
    if json_output or first_point is None or last_point is None:
        return
    print(
        f'Arming Coord:{first_point["lat"]},{first_point["lon"]}'
    )
    print(
        f'Disarmed Coord:{last_point["lat"]},{last_point["lon"]}'
    )


def process_log(
    data: bytes,
    log_index: int,
    start: int,
    end: int,
    output_prefix: Path,
    metadata_entries: list[dict[str, object]],
    json_output: bool,
    only_gpx: bool,
    info_output: bool,
) -> None:
    """Decode one embedded log and emit the requested output files."""
    frame_defs, config, payload_start = parse_header(data, start)
    metadata = build_log_metadata(log_index, config)
    metadata_entries.append(metadata)
    if not json_output:
        print_log_metadata(log_index, config)
    ctx = LogContext(frame_defs=frame_defs, config=config)

    main_names = frame_defs.get("I", FrameDef()).names
    slow_names = frame_defs.get("S", FrameDef()).names
    gps_names = frame_defs.get("G", FrameDef()).names

    main_csv_path = output_prefix.with_name(f"{output_prefix.name}.{log_index:02d}.csv")
    gps_csv_path = output_prefix.with_name(
        f"{output_prefix.name}.{log_index:02d}.gps.csv"
    )
    gpx_path = output_prefix.with_name(f"{output_prefix.name}.{log_index:02d}.gps.gpx")

    gps_points: list[dict[str, str]] = []
    reader = ByteReader(data, payload_start, end)

    main_handle = None
    if not only_gpx:
        main_handle = main_csv_path.open("w", encoding="utf-8", newline="")

    with (
        main_handle
        if main_handle is not None
        else open("/dev/null", "w", encoding="utf-8", newline="")
    ) as main_handle_ctx:
        main_writer = csv.writer(main_handle_ctx) if not only_gpx else None
        if main_writer is not None:
            main_writer.writerow(main_names + slow_names)

        gps_handle = None
        gps_writer = None

        try:
            while not reader.eof():
                marker = reader.peek_byte()
                if marker is None:
                    break
                if marker not in FRAME_MARKERS:
                    reader.pos += 1
                    continue

                frame_type = chr(reader.read_byte())

                if frame_type == "I":
                    frame = decode_frame(ctx, reader, "I", ctx.last_main, None, 0)
                    ctx.last_main = frame
                    ctx.last_main2 = frame
                    ctx.last_main_iteration = frame[0]
                    time_idx = ctx.main_time_index
                    ctx.last_main_time = (
                        frame[time_idx] if time_idx >= 0 else ctx.last_main_time
                    )
                    if main_writer is not None:
                        slow_values = (
                            ctx.last_slow if ctx.last_slow else ["" for _ in slow_names]
                        )
                        main_writer.writerow(format_main_row(ctx, frame, slow_values))
                elif frame_type == "P":
                    if ctx.last_main is None:
                        continue
                    skipped = count_intentionally_skipped_frames(ctx)
                    frame = decode_frame(
                        ctx, reader, "P", ctx.last_main, ctx.last_main2, skipped
                    )
                    ctx.last_main2 = ctx.last_main
                    ctx.last_main = frame
                    ctx.last_main_iteration = frame[0]
                    time_idx = ctx.main_time_index
                    ctx.last_main_time = (
                        frame[time_idx] if time_idx >= 0 else ctx.last_main_time
                    )
                    if main_writer is not None:
                        slow_values = (
                            ctx.last_slow if ctx.last_slow else ["" for _ in slow_names]
                        )
                        main_writer.writerow(format_main_row(ctx, frame, slow_values))
                elif frame_type == "S":
                    ctx.last_slow = decode_frame(ctx, reader, "S", None, None, 0)
                elif frame_type == "H":
                    ctx.gps_home = decode_frame(ctx, reader, "H", None, None, 0)
                elif frame_type == "G":
                    frame = decode_frame(ctx, reader, "G", None, None, 0)
                    ctx.last_gps = frame
                    if not only_gpx and gps_writer is None:
                        gps_handle = gps_csv_path.open(
                            "w", encoding="utf-8", newline=""
                        )
                        gps_writer = csv.writer(gps_handle)
                        gps_writer.writerow(
                            ["time (us)"]
                            + [
                                (
                                    name
                                    if name not in {"GPS_speed", "GPS_ground_course"}
                                    else {
                                        "GPS_speed": "GPS_speed (m/s)",
                                        "GPS_ground_course": "GPS_ground_course",
                                    }[name]
                                )
                                for name in gps_names[1:]
                            ]
                        )
                    if gps_writer is not None:
                        gps_writer.writerow(format_gps_row(ctx, frame))

                    if (
                        ctx.gps_coord_index_0 >= 0
                        and ctx.gps_coord_index_1 >= 0
                        and ctx.gps_altitude_index >= 0
                    ):
                        gps_time = (
                            frame[ctx.gps_time_index] if ctx.gps_time_index >= 0 else -1
                        )
                        gps_points.append(
                            {
                                "lat": f"{frame[ctx.gps_coord_index_0] / 10000000:.7f}",
                                "lon": f"{frame[ctx.gps_coord_index_1] / 10000000:.7f}",
                                "ele": f"{frame[ctx.gps_altitude_index] / 100:.2f}",
                                "time": gpx_timestamp(config.log_start_dt, gps_time),
                            }
                        )
                elif frame_type == "E":
                    event_type = reader.read_byte()
                    if event_type == 14:
                        ctx.last_main_iteration = reader.read_unsigned_vb()
                        ctx.last_main_time = reader.read_unsigned_vb()
                    elif event_type == 255:
                        end_marker = data[reader.pos : reader.pos + 11]
                        if end_marker == b"End of log\x00":
                            reader.pos += 11
                            break
                    elif event_type == 0:
                        _ = reader.read_unsigned_vb()
                    elif event_type == 13:
                        fn = reader.read_byte()
                        if fn > 127:
                            reader.pos += 4
                        else:
                            _ = reader.read_signed_vb()
                    else:
                        continue
        except (EOFError, ValueError):
            # Flash dumps frequently end on a truncated final frame. Keep the data decoded so far.
            if reader.pos < end:
                raise
        finally:
            if gps_handle is not None:
                gps_handle.close()

    if gps_points:
        write_gpx(gpx_path, gps_points)
        if info_output or json_output:
            metadata["gps_point_count"] = len(gps_points)
            add_gps_info_metadata(metadata, gps_points[0], gps_points[-1])
        if info_output:
            print_gps_info(json_output, gps_points[0], gps_points[-1])
    else:
        if info_output or json_output:
            metadata["gps_point_count"] = 0
            add_gps_info_metadata(metadata, None, None)
        print_no_gps_traces(json_output)


def find_log_offsets(data: bytes) -> list[int]:
    """Locate embedded Blackbox logs inside a raw dump."""
    offsets: list[int] = []
    pos = 0
    needle = b"H Product:"
    while True:
        idx = data.find(needle, pos)
        if idx == -1:
            break
        offsets.append(idx)
        pos = idx + 1
    return offsets


def compute_file_hashes(data: bytes) -> dict[str, str]:
    """Return the MD5 and SHA256 digests for one input file."""
    return {
        "md5": hashlib.md5(data).hexdigest(),
        "sha256": hashlib.sha256(data).hexdigest(),
    }


def decode_file(
    path: Path, json_output: bool = False, only_gpx: bool = False, info_output: bool = False
) -> None:
    """Decode every embedded log from ``path``."""
    data = path.read_bytes()
    file_hashes = compute_file_hashes(data)
    offsets = find_log_offsets(data)
    if not offsets:
        raise SystemExit("no Blackbox logs found")

    metadata_entries: list[dict[str, object]] = []
    if info_output and not json_output:
        print(f"MD5:{file_hashes['md5']}")
        print(f"SHA256:{file_hashes['sha256']}")

    offsets.append(len(data))
    for log_index, start in enumerate(offsets[:-1], start=1):
        end = offsets[log_index]
        process_log(
            data,
            log_index,
            start,
            end,
            path,
            metadata_entries,
            json_output,
            only_gpx,
            info_output,
        )

    if json_output:
        print(
            json.dumps(
                {
                    "input_file": str(path),
                    **file_hashes,
                    "logs": metadata_entries,
                },
                ensure_ascii=False,
                indent=2,
            )
        )


def main() -> None:
    """Parse command-line arguments and run the decoder."""
    parser = argparse.ArgumentParser(
        description="Decode a Betaflight/INAV Blackbox file into CSV and GPX."
    )
    parser.add_argument(
        "--json", action="store_true", help="Print log metadata as JSON on stdout"
    )
    parser.add_argument(
        "--onlygpx",
        action="store_true",
        help="Generate only GPX files, skip CSV outputs",
    )
    parser.add_argument(
        "--info",
        action="store_true",
        help="Print metadata plus the first and last GPS coordinates for each log",
    )
    parser.add_argument("input", type=Path, help="Path to the Blackbox file")
    args = parser.parse_args()
    decode_file(
        args.input,
        json_output=args.json,
        only_gpx=args.onlygpx,
        info_output=args.info,
    )


if __name__ == "__main__":
    main()
