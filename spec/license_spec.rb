require "spec_helper"

RSpec.describe "LICENSE" do
  let(:file) { repo / "LICENSE" }
  let(:content) { File.read file }

  it "exists" do
    expect(file).to exist
  end

  it "is a file" do
    expect(file).to be_file
  end

  it "is readable" do
    expect(file).to be_readable
  end

  describe "LICENSE's content" do
    it "has a line starting with `Copyright`" do
      expect(content).to match(/^Copyright/)
    end
  end
end

