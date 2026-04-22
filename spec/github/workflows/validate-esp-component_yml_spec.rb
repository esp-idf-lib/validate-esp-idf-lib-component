require "spec_helper"

RSpec.describe ".github/workflows/validate-esp-component.yml" do
  let(:file) { repo / ".github" / "workflows" / "validate-esp-component.yml" }
  let(:content) { File.read file }

  it "exists" do
    skip_shared_workflows_component
    expect(file).to exist
  end

  it "does not mention template-component" do
    skip_template_component
    skip_shared_workflows_component
    expect(content).not_to match(/template-component/)
  end
end
