# validate-esp-idf-lib-component

A tool to validate [esp-idf-lib](https://github.com/esp-idf-lib) components.

## Requirements

* [python](https://www.python.org/) 3.9 or newer
* pip packages from `requirements.txt`

## Usage

Clone and set up the tool.

```sh
git clone https://github.com/esp-idf-lib/validate-esp-idf-lib-component.git
cd validate-esp-idf-lib-component
python3 -m venv .venv
.venv/bin/pip install -r requirements.txt
```

Clone the target repo to validate. The cloned directory name must be `repo`.

```sh
git clone https://github.com/esp-idf-lib/$COMPONENT_NAME repo
```

```sh
.venv/bin/pytest
```

A successful output looks like below:

```text
tests/test_examples.py ..........                  [ 12%]
tests/test_idf_component_yml.py ..........         [ 24%]
...
============================= 68 passed in 0.42s ==============================
```

A failed output looks like below:

```text
FAILED tests/test_idf_component_yml.py::test_has_the_same_version_in_eil_yml
...
============================= 1 failed, 67 passed in 0.41s =====================
```

## What is checked

* `.eil.yml` exists and has the required keys, the component name is not
  `template-component`.
* `idf_component.yml` has the same version as `.eil.yml`, the URLs point to
  the right places and the documentation site, and `docs/**/*` is excluded
  from the package.
* `LICENSE` exists and starts a line with `Copyright`.
* `README.md` exists and does not mention `template-component`.
* `CMakeLists.txt` exists and does not mention `template-content`.
* every directory in `examples/` has a `README.md`, and there are no broken
  symlinks.
* `.astylerc` exists and is readable.
* `eil-cmake-utils` is a submodule of the repository.
* the `build` directory is not committed.

The `.eil.yml` dependencies are not checked: the file describes the component
for the website and the component manager, and the build requirements come
from `CMakeLists.txt` and `idf_component.yml`.
