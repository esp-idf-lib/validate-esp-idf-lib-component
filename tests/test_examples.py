"""Checks of the examples directory."""

import os

from support import REPO


def examples():
    return REPO / "examples"


def test_exists():
    assert examples().exists()


def test_is_a_directory():
    assert examples().is_dir()


def test_has_at_least_one_example_directory():
    assert len([c for c in examples().iterdir() if c.is_dir()]) > 0


def test_does_not_have_broken_symlinks():
    # a broken symlink raises when the directory is listed
    for entry in examples().iterdir():
        if entry.is_symlink():
            os.listdir(entry)


def test_every_example_has_a_readme():
    for d in examples().iterdir():
        if d.is_dir():
            readme = d / "README.md"
            assert readme.exists(), "%s is missing" % readme
            assert readme.is_file(), "%s is not a file" % readme
