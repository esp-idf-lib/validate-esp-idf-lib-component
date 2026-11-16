"""Checks of README.md."""

from support import REPO, read, skip_shared_workflows, skip_template


def test_exists():
    assert (REPO / "README.md").exists()


def test_is_a_file():
    assert (REPO / "README.md").is_file()


def test_does_not_mention_template_component():
    skip_shared_workflows()
    skip_template()
    assert "template-component" not in read(REPO / "README.md")
