"""Helpers shared by the validator tests.

The component under test is expected to be cloned into ``repo`` next to the
tests, the same layout the Ruby specs used.
"""

from __future__ import annotations

import functools
import subprocess
from pathlib import Path

import pytest
import yaml

_ROOT = Path(__file__).resolve().parent.parent
REPO = _ROOT / "repo"


@functools.lru_cache(maxsize=1)
def component_name() -> str:
    url = subprocess.run(
        ["git", "-C", str(REPO), "remote", "get-url", "origin"],
        check=True,
        capture_output=True,
        text=True,
    ).stdout.strip()
    # git@github.com:esp-idf-lib/template-component.git
    if url.startswith("git@github.com"):
        url = url.replace("git@", "https://", 1).replace("github.com:", "github.com/", 1)
    # actions/checkout uses URLs without the suffix
    if url.endswith(".git"):
        url = url[: -len(".git")]
    return url.rsplit("/", 1)[-1]


@functools.lru_cache(maxsize=1)
def eil() -> dict:
    return yaml.safe_load((REPO / ".eil.yml").read_text())


@functools.lru_cache(maxsize=1)
def idf_component() -> dict:
    return yaml.safe_load((REPO / "idf_component.yml").read_text())


def is_template() -> bool:
    return component_name() == "template-component"


def is_shared_workflows() -> bool:
    return component_name() == "shared-workflows"


def skip_template() -> None:
    if is_template():
        pytest.skip("the component is template-component")


def skip_shared_workflows() -> None:
    if is_shared_workflows():
        pytest.skip("the component is shared-workflows")


def read(path: Path) -> str:
    return path.read_text()


def is_readable(path: Path) -> bool:
    import os

    return os.access(path, os.R_OK)
