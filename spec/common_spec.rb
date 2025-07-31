require "spec_helper"

RSpec.describe "common" do
  let(:dir) { repo / "common" }

  it "exists" do
    expect(dir).to exist
  end

  it "is a directory" do
    expect(dir).to be_directory
  end

  it "is a submodule" do
    expect(`cd #{repo} ; git submodule | cut -d " " -f 3`.chomp).to eq dir.basename.to_s
  end
end
