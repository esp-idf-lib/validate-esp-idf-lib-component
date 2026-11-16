"""Checks of CMakeLists.txt."""

from support import REPO, read, skip_template


def test_exists():
    assert (REPO / "CMakeLists.txt").exists()


def test_does_not_mention_template_component():
    skip_template()
    assert "template-content" not in read(REPO / "CMakeLists.txt")
