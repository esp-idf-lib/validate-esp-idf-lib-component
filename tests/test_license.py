"""Checks of LICENSE."""

import re

from support import REPO, is_readable, read


def test_exists():
    assert (REPO / "LICENSE").exists()


def test_is_a_file():
    assert (REPO / "LICENSE").is_file()


def test_is_readable():
    assert is_readable(REPO / "LICENSE")


def test_has_a_line_starting_with_copyright():
    assert re.search(r"^Copyright", read(REPO / "LICENSE"), re.MULTILINE)
