require "spec_helper"

RSpec.describe "README.md" do
  let(:file) { repo / "README.md" }

  it "exists" do
    expect(file).to exist
  end

  it "is a file" do
    expect(file).to be_file
  end
end
