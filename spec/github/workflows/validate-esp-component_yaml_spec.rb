require "spec_helper"

RSpec.describe ".github/workflows/build.yml" do
  let(:file) { repo / ".github/workflows/validate-esp-component.yml" }

  it "exists" do
    expect(file).to be_file, "expected #{file} to be file, but not. copy #{file.basename} from https://github.com/esp-idf-lib/template-component/tree/main/.github/workflows"
  end
end
