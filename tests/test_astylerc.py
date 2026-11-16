"""Checks of .astylerc."""

from support import REPO, is_readable


def test_exists():
    assert (REPO / ".astylerc").exists()


def test_is_a_file():
    assert (REPO / ".astylerc").is_file()


def test_is_readable():
    assert is_readable(REPO / ".astylerc")
