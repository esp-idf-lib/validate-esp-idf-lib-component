require "spec_helper"

RSpec.describe ".github/workflows/publish-esp-component.yml" do
  let(:file) { repo / ".github" / "workflows" / "publish-esp-component.yml" }
  let(:content) { File.read file }

  it "exists" do
    expect(file).to exist
  end

  it "does not mention template-component" do
    skip_template_component
    expect(content).not_to match(/template-component/)
  end
end
