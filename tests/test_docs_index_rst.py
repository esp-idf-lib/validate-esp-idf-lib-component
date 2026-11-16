"""Checks of docs/index.rst."""

from support import REPO, is_shared_workflows, is_template, read


def index_rst():
    return REPO / "docs" / "index.rst"


def test_exists():
    assert index_rst().exists()


def test_is_a_file():
    assert index_rst().is_file()


def test_does_not_mention_template_component():
    if is_template():
        import pytest

        pytest.skip("the component is template-component")
    if is_shared_workflows():
        import pytest

        pytest.skip("the component is shared-workflows")
    assert "template-component" not in read(index_rst())
