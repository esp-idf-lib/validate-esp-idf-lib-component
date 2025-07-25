require "spec_helper"

RSpec.describe "idf_component.yml" do
  let(:idf) { YAML.safe_load(File.read(repo / "idf_component.yml")) }
  let(:eil) { YAML.safe_load(File.read(repo / ".eil.yml")) }

  it "exists" do
    file = repo / "idf_component.yml"

    expect(file.file?).to be true
  end

  it "has the same targets except esp8266" do
    targets = idf["targets"].sort
    targets_eil = eil["targets"].sort.reject { |e| e == "esp8266" }

    expect(targets).to eq targets_eil
  end
end
