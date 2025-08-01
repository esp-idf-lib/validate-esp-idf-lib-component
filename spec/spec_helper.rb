require "pathname"
require "yaml"
require "uri"

RSpec.configure do |config|
  # rspec-expectations config goes here. You can use an alternate
  # assertion/expectation library such as wrong or the stdlib/minitest
  # assertions if you prefer.
  config.expect_with :rspec do |expectations|
    # This option will default to `true` in RSpec 4. It makes the `description`
    # and `failure_message` of custom matchers include text for helper methods
    # defined using `chain`, e.g.:
    #     be_bigger_than(2).and_smaller_than(4).description
    #     # => "be bigger than 2 and smaller than 4"
    # ...rather than:
    #     # => "be bigger than 2"
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    # Prevents you from mocking or stubbing a method that does not exist on
    # a real object. This is generally recommended, and will default to
    # `true` in RSpec 4.
    mocks.verify_partial_doubles = true
  end
end

def repo
  Pathname.new("repo")
end

def eil
  YAML.safe_load(File.read(repo / ".eil.yml"))
end

# returns true when the repo is template-component
def template_component?
  origin_url = `cd repo ; git remote get-url origin`.chomp
  # fixup origin_url if it is git protocol scheme, which URI does not
  # understand.
  #
  # git@github.com:esp-idf-lib/template-component.git
  # https://github.com/esp-idf-lib/template-component.git
  origin_url.gsub!(/git@/, "https://").gsub!("github.com:", "github.com/") if origin_url.start_with? "git@github.com"

  # XXX action/checkout uses URLs without `.git`.
  origin_url.gsub!(/\.git$/, "")
  uri = URI(origin_url)
  component_name = uri.path.split("/").last
  component_name == "template-component"
end

# skip when the repo under test is template-component
def skip_template_component
  skip("the component is template-component") if template_component?
end
