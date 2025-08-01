require "spec_helper"

RSpec.describe "build" do
  let(:dir) { repo / "build" }

  it "does not exist" do
    expect(dir).not_to exist
  end
end
