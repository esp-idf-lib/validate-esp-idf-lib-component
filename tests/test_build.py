"""The build directory must not be committed."""

from support import REPO


def test_build_directory_does_not_exist():
    assert not (REPO / "build").exists()
