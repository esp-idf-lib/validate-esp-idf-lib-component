"""Checks of idf_component.yml."""

import re

from support import REPO, eil, idf_component


def test_exists():
    assert (REPO / "idf_component.yml").is_file()


def test_has_version():
    assert "version" in idf_component()


def test_has_valid_version_that_matches_a_valid_pattern():
    assert re.search(r"\d+\.\d+\.\d+([a-zA-Z0-9\-_]+)?", str(idf_component()["version"]))


def test_has_the_same_version_in_eil_yml():
    assert idf_component()["version"] == eil()["version"]


def test_has_maintainers():
    assert "maintainers" in idf_component()


def test_has_a_list_of_maintainers():
    assert isinstance(idf_component()["maintainers"], list)


def test_has_at_least_one_maintainer():
    assert len(idf_component()["maintainers"]) > 0


def test_has_description():
    assert "description" in idf_component()


def test_has_description_more_than_one_character():
    assert len(idf_component()["description"]) > 0


def test_has_license():
    assert "license" in idf_component()


def test_has_url():
    assert "url" in idf_component()


def test_has_url_pointing_to_the_core_repository():
    assert idf_component()["url"] == "https://github.com/esp-idf-lib/core"


def test_has_repository():
    assert "repository" in idf_component()


def test_has_repository_url_pointing_to_the_repository():
    assert idf_component()["repository"] == "https://github.com/esp-idf-lib/%s" % eil()["name"]


def test_has_documentation():
    assert "documentation" in idf_component()


def test_has_documentation_url_pointing_to_the_pages_site():
    assert idf_component()["documentation"] == "https://esp-idf-lib.github.io/%s/" % eil()["name"]


def test_has_issues():
    assert "issues" in idf_component()


def test_has_issues_url_pointing_to_the_issues():
    assert idf_component()["issues"] == "https://github.com/esp-idf-lib/%s/issues" % eil()["name"]


def test_has_discussion():
    assert "discussion" in idf_component()


def test_has_discussion_url_pointing_to_the_core_repository():
    assert idf_component()["discussion"] == "https://github.com/esp-idf-lib/core/discussions"


def test_has_files():
    assert "files" in idf_component()


def test_has_files_with_exclude():
    assert "exclude" in idf_component()["files"]


def test_excludes_the_entire_docs_directory():
    assert "docs/**/*" in idf_component()["files"]["exclude"]
