require "spec_helper"

RSpec.describe ".eil.yml" do
  let(:eil) { YAML.safe_load(File.read(repo / ".eil.yml")) }

  it "exists" do
    expect(repo / ".eil.yml").to be_file
  end

  it "has name" do
    expect(eil).to have_key "name"
  end

  it "has description" do
    expect(eil).to have_key "description"
  end

  it "has version" do
    expect(eil).to have_key "version"
  end

  it "has groups" do
    expect(eil).to have_key "groups"
  end

  it "has a list of groups" do
    expect(eil["groups"]).to be_a Array
  end

  it "has at least one group" do
    expect(eil["groups"].length).to be > 0
  end

  it "has depends" do
    expect(eil).to have_key "depends"
  end

  it "has a list of depends" do
    expect(eil["depends"]).to be_a Array
  end

  it "has at least one depends" do
    expect(eil["depends"].length).to be > 0
  end

  it "has thread_safe" do
    expect(eil).to have_key "thread_safe"
  end

  it "has targets" do
    expect(eil).to have_key "targets"
  end

  it "has license" do
    expect(eil).to have_key "license"
  end

  it "has copyrights" do
    expect(eil).to have_key "copyrights"
  end

  it "has a list of copyrights" do
    expect(eil["copyrights"]).to be_a Array
  end
end
