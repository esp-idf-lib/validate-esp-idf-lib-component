require "spec_helper"

RSpec.describe "docs/index.rst" do
  let(:file) { repo / "docs" / "index.rst" }
  let(:content) { File.read file }

  it "exists" do
    expect(file).to exist
  end

  it "is a file" do
    expect(file).to be_file
  end

  describe "index.rst's content" do
    it "does not mention template-component" do
      skip_template_component
      expect(content).not_to match(/template-component/)
    end
  end
end

