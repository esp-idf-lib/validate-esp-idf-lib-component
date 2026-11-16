"""Checks of the eil-cmake-utils submodule."""

import subprocess

from support import REPO

HOW_TO_FIX = """How to fix it:
  * Remove "common" git submodule
    * git rm common
  * Add eil-cmake-utils as a submodule
    * git submodule add git@github.com:esp-idf-lib/eil-cmake-utils.git

Edit CMakeLists.txt and add the following at the TOP of file:

  list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_LIST_DIR}/eil-cmake-utils/cmake)

Remove `common` related lines from CMakeLists.txt

Edit CMakeLists.txt and add the following at the BOTTOM of file:

  include(eil_ci)

Check if the build passes

  idf.py build -C examples/default

When the test passes, commit the change.
"""


def submodule_paths():
    out = subprocess.run(
        ["git", "-C", str(REPO), "submodule"],
        check=False,
        capture_output=True,
        text=True,
    ).stdout
    return [line.split()[1] for line in out.splitlines() if len(line.split()) > 2]


def test_exists():
    assert (REPO / "eil-cmake-utils").exists(), HOW_TO_FIX


def test_is_a_directory():
    assert (REPO / "eil-cmake-utils").is_dir()


def test_is_a_submodule():
    assert "eil-cmake-utils" in submodule_paths()
