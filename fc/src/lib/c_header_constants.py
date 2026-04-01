#!/usr/bin/env python3
"""Helpers to extract integer constants from simple C headers.

author = "CIRCL https://www.circl.lu/"
license = "GNU Affero General Public Licence https://www.gnu.org/licenses/agpl-3.0.en.html"
"""

from __future__ import annotations

import ast
import re
from pathlib import Path


DEFINE_RE = re.compile(r"^\s*#define\s+([A-Za-z_]\w*)\s+(.+?)\s*$")
ENUM_START_RE = re.compile(r"^\s*(typedef\s+)?enum\b")
ENUM_ENTRY_RE = re.compile(r"^\s*([A-Za-z_]\w*)\s*(?:=\s*([^,]+))?\s*,?\s*$")
COMMENT_RE = re.compile(r"//.*$")
INTEGER_SUFFIX_RE = re.compile(r"(?<=\d)[uUlL]+")


def _strip_comments(text: str) -> str:
    return COMMENT_RE.sub("", text).strip()


def _safe_eval(  # pylint: disable=too-many-return-statements,too-many-branches
    expr: str,
    symbols: dict[str, int],
) -> int:
    cleaned = INTEGER_SUFFIX_RE.sub("", _strip_comments(expr))
    node = ast.parse(cleaned, mode="eval")

    def visit(current: ast.AST) -> int:
        if isinstance(current, ast.Expression):
            return visit(current.body)
        if isinstance(current, ast.Constant) and isinstance(current.value, int):
            return current.value
        if isinstance(current, ast.Name):
            if current.id not in symbols:
                raise KeyError(current.id)
            return symbols[current.id]
        if isinstance(current, ast.BinOp):
            left = visit(current.left)
            right = visit(current.right)
            if isinstance(current.op, ast.Add):
                return left + right
            if isinstance(current.op, ast.Sub):
                return left - right
            if isinstance(current.op, ast.BitOr):
                return left | right
            if isinstance(current.op, ast.BitAnd):
                return left & right
            if isinstance(current.op, ast.LShift):
                return left << right
            if isinstance(current.op, ast.RShift):
                return left >> right
        if isinstance(current, ast.UnaryOp):
            operand = visit(current.operand)
            if isinstance(current.op, ast.UAdd):
                return operand
            if isinstance(current.op, ast.USub):
                return -operand
            if isinstance(current.op, ast.Invert):
                return ~operand
        raise ValueError(f"Unsupported constant expression: {cleaned}")

    return visit(node)


def load_integer_constants(header_path: Path) -> dict[str, int]:
    """Load integer #defines and enum constants from a C header."""

    constants: dict[str, int] = {}
    text = header_path.read_text(encoding="utf-8")
    in_enum = False
    current_enum_value = -1

    for raw_line in text.splitlines():
        line = _strip_comments(raw_line)
        if not line:
            continue

        if not in_enum:
            define_match = DEFINE_RE.match(line)
            if define_match:
                name, expr = define_match.groups()
                try:
                    constants[name] = _safe_eval(expr, constants)
                except (KeyError, ValueError, SyntaxError):
                    pass
                continue

            if ENUM_START_RE.match(line):
                in_enum = True
                current_enum_value = -1
                continue

        if in_enum:
            if line.startswith("}"):
                in_enum = False
                continue

            entry_match = ENUM_ENTRY_RE.match(line)
            if not entry_match:
                continue

            name, expr = entry_match.groups()
            if expr is None:
                current_enum_value += 1
            else:
                try:
                    current_enum_value = _safe_eval(expr, constants)
                except (KeyError, ValueError, SyntaxError):
                    continue
            constants[name] = current_enum_value

    return constants


def first_existing_path(*candidates: Path) -> Path | None:
    """Return the first existing path from the provided candidates."""

    for candidate in candidates:
        if candidate.exists():
            return candidate
    return None
