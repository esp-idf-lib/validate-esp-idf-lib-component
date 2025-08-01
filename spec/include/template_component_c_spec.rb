require "spec_helper"

RSpec.describe "include/template_component.c" do
  let(:file) { repo / "include" / "template_component.c" }

  it "does not exist" do
    skip_template_component
    expect(file).not_to exist
  end
end
