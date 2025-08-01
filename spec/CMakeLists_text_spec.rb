require "spec_helper"

RSpec.describe "CMakeLists.txt" do
  let(:file) { repo / "CMakeLists.txt" }
  let(:content) { File.read file }

  it "exists" do
    expect(file).to exist
  end

  describe "CMakeLists.txt's content" do
    it "does not mention template-component" do
      skip_template_component
      expect(content).not_to match(/template-content/)
    end
  end
end

