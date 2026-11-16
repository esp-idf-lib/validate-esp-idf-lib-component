"""The template files must not survive in a real component."""

import pytest

from support import REPO, is_template


@pytest.mark.parametrize("name", ["template_component.c", "template_component.h"])
def test_template_file_does_not_exist(name):
    if is_template():
        pytest.skip("the component is template-component")
    assert not (REPO / "include" / name).exists()
