require "spec_helper"

RSpec.describe "examples" do
  let(:dir) { repo / "examples" }

  it "exists" do
    expect(dir).to exist
  end

  it "is a directory" do
    expect(dir).to be_directory
  end

  it "has at least one example directory" do
    expect(dir.children.select { |c| c.directory? }.length).to be > 0
  end

  it "does not have broken symlinks" do
    symlinks = dir.children.select(&:symlink?)

    expect do
      # broken symlinks raise error
      symlinks.map { |s| s.children }
    end.not_to raise_error
  end

  it "has examples and all of them have README.md" do
    readmes = dir.children.select(&:directory?).map { |d| d / "README.md" }
    expect(readmes).to all(be_exist).and all(be_file)
  end
end
