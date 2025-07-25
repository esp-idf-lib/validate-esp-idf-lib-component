require "spec_helper"

RSpec.describe ".github/workflows/build-docs.yml" do
  let(:file) { repo / ".github/workflows/build-docs.yml" }
  skip "repository shared-workflows does not need it" if eil["name"] == "shared-workflows"

  it "exists" do
    expect(file).to be_file, "expected #{file} to be file, but not. copy #{file.basename} from https://github.com/esp-idf-lib/template-component/tree/main/.github/workflows"
  end
end
