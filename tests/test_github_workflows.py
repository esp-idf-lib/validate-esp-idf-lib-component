"""Checks of the GitHub workflows of the component."""

import pytest

from support import REPO, is_shared_workflows, is_template, read

WORKFLOWS = [
    "build-docs.yml",
    "build.yml",
    "publish-esp-component.yml",
    "publish-gh-pages.yml",
    "validate-component.yml",
    "validate-esp-component.yml",
]

HOW_TO_FIX = (
    "copy the file from "
    "https://github.com/esp-idf-lib/template-component/tree/main/.github/workflows"
)


def is_shared_workflows_component() -> bool:
    return is_shared_workflows()


@pytest.mark.parametrize("name", WORKFLOWS)
def test_workflow_exists(name):
    if name != "validate-component.yml" and is_shared_workflows_component():
        pytest.skip("repository shared-workflows does not need it")
    path = REPO / ".github" / "workflows" / name
    assert path.is_file(), "expected %s to be file, but not. %s" % (path, HOW_TO_FIX)


@pytest.mark.parametrize("name", ["publish-esp-component.yml", "validate-esp-component.yml"])
def test_workflow_exists_and_does_not_mention_template_component(name):
    if is_shared_workflows_component():
        pytest.skip("the component is shared-workflows")
    path = REPO / ".github" / "workflows" / name
    assert path.exists()
    if is_template():
        pytest.skip("the component is template-component")
    assert "template-component" not in read(path)
