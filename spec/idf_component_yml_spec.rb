require "spec_helper"

RSpec.describe "idf_component.yml" do
  let(:idf) { YAML.safe_load(File.read(repo / "idf_component.yml")) }
  let(:eil) { YAML.safe_load(File.read(repo / ".eil.yml")) }
  let(:repo_name) { eil["name"] }

  it "exists" do
    file = repo / "idf_component.yml"

    expect(file.file?).to be true
  end

  it "has version" do
    expect(idf).to have_key "version"
  end

  it "has valid version that matches a valid pattern" do
    expect(idf["version"]).to match(/\d+\.\d+\.\d+([a-zA-Z0-0\-_]+)?/)
  end

  it "has the same version in .eil.yml" do
    expect(idf["version"]).to eq eil["version"]
  end

  it "has maintainers" do
    expect(idf).to have_key "maintainers"
  end

  it "has a array of maintainer" do
    expect(idf["maintainers"]).to be_a Array
  end

  it "has at least one maintainer" do
    expect(idf["maintainers"].length).to be > 0
  end

  it "has description" do
    expect(idf).to have_key "description"
  end

  it "has description more than one character" do
    expect(idf["description"]).not_to be_empty
  end

  it "has targets" do
    expect(idf).to have_key "targets"
  end

  it "has more than one target" do
    expect(idf["targets"].length).to be > 0
  end

  it "has no esp8266 target" do
    expect(idf["targets"]).not_to include "esp8266"
  end

  it "has the same targets except esp8266" do
    targets = idf["targets"].sort
    targets_eil = eil["targets"].sort.reject { |e| e == "esp8266" }

    expect(targets).to eq targets_eil
  end

  it "has uniq targets without duplicate" do
    targets = idf["targets"].sort
    expect(targets).to eq targets.uniq
  end

  it "has sorted targets by name" do
    targets = idf["targets"]
    sorted_targets = idf["targets"].sort
    expect(targets).to eq sorted_targets
  end

  it "has license" do
    expect(idf).to have_key "license"
  end

  it "has url" do
    expect(idf).to have_key "url"
  end

  it "has url pointing to the core repository" do
    expect(idf["url"]).to eq "https://github.com/esp-idf-lib/core"
  end

  it "has repository" do
    expect(idf).to have_key "repository"
  end

  it "has repository URL pointing to the repository" do
    expect(idf["repository"]).to eq "https://github.com/esp-idf-lib/#{repo_name}"
  end

  it "has documentation" do
    expect(idf).to have_key "documentation"
  end

  it "has documentation URL pointing to https://esp-idf-lib.github.io/ and ends with /" do
    expect(idf["documentation"]).to eq "https://esp-idf-lib.github.io/#{repo_name}/"
  end

  it "has issues" do
    expect(idf).to have_key "issues"
  end

  it "has issues URL pointing to its repository's issues" do
    expect(idf["issues"]).to eq "https://github.com/esp-idf-lib/#{repo_name}/issues"
  end

  it "has discussion" do
    expect(idf).to have_key "discussion"
  end

  it "has discussion URL pointing to the core repository" do
    expect(idf["discussion"]).to eq "https://github.com/esp-idf-lib/core/discussions"
  end

  it "has files" do
    expect(idf).to have_key "files"
  end

  it "has files with exclude" do
    expect(idf["files"]).to have_key "exclude"
  end

  it "excludes the entire docs directory" do
    expect(idf["files"]["exclude"]).to include "docs/**/*"
  end
end
