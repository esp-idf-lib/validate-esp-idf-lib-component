require "spec_helper"

RSpec.describe "eil-cmake-utils" do
  let(:dir) { repo / "eil-cmake-utils" }

  it "exists" do
    how_to_fix = <<~TEXT
    How to fix it:
      * Remove "common` git submodule
        * git rm common
      * Add eil-cmake-utils as a submodule
        * git submodule add git@github.com:esp-idf-lib/eil-cmake-utils.git

    Edit CMakeLists.txt and add the following at the TOP of file:

      list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_LIST_DIR}/eil-cmake-utils/cmake)

    Edit CMakeLists.txt and add the following at the BOTTOM of file:

      include(eil_ci)

    Check if the build passes

    idf.py build -C examples/default

    Whne the test passes, commit the change.
    TEXT
    expect(dir).to exist, how_to_fix
  end

  it "is a directory" do
    expect(dir).to be_directory
  end

  it "is a submodule" do
    expect(`cd #{repo} ; git submodule | cut -d " " -f 3`.chomp).to eq dir.basename.to_s
  end
end
