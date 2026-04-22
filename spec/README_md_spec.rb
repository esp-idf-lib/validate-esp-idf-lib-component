require "spec_helper"

RSpec.describe "README.md" do
  let(:file) { repo / "README.md" }
  let(:content) { File.read file }

  it "exists" do
    expect(file).to exist
  end

  it "is a file" do
    expect(file).to be_file
  end

  describe "README's content" do
    it "does not mention template-component" do
      skip_shared_workflows_component
      skip_template_component
      expect(content).not_to match(/template-component/)
    end
  end
end
