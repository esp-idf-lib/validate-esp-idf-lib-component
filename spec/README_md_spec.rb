require "spec_helper"

RSpec.describe "README.md" do
  it "exists" do
    file = repo / "README.md"
    expect(file.file?).to be true
  end
end
