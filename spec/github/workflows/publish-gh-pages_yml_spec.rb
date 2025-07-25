require "spec_helper"

RSpec.describe ".github/workflows/publish-gh-pages.yml" do
  let(:file) { repo / ".github/workflows/publish-gh-pages.yml" }

  it "exists" do
    expect(file).to be_file, "expected #{file} to be file, but not. copy #{file.basename} from https://github.com/esp-idf-lib/template-component/tree/main/.github/workflows"
  end
end
