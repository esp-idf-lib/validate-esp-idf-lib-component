"""Checks of .eil.yml."""

from support import REPO, eil, skip_template


def test_eil_yml_exists():
    assert (REPO / ".eil.yml").is_file()


def test_has_name():
    assert "name" in eil()


def test_has_name_other_than_template_component():
    skip_template()
    assert eil()["name"] != "template-component"


def test_has_description():
    assert "description" in eil()


def test_has_version():
    assert "version" in eil()


def test_has_groups():
    assert "groups" in eil()


def test_has_a_list_of_groups():
    assert isinstance(eil()["groups"], list)


def test_has_at_least_one_group():
    assert len(eil()["groups"]) > 0


def test_has_thread_safe():
    assert "thread_safe" in eil()


def test_has_license():
    assert "license" in eil()


def test_has_copyrights():
    assert "copyrights" in eil()


def test_has_a_list_of_copyrights():
    assert isinstance(eil()["copyrights"], list)
