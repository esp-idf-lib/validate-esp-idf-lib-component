require "spec_helper"

RSpec.describe ".astylerc" do
  let(:file) { repo / ".astylerc" }

  it "exists" do
    expect(file).to exist
  end

  it "is a file" do
    expect(file).to be_file
  end

  it "is readable" do
    expect(file).to be_readable
  end
end
