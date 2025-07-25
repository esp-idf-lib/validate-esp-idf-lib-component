# validate-esp-idf-lib-component

A tool to validate [esp-idf-lib](https://github.com/esp-idf-lib) components.

## Requirements

* [ruby](https://www.ruby-lang.org/) 3.x
* [bundler](https://bundler.io/)

## Usage

Clone and setup the tool.

```sh
git clone https://github.com/esp-idf-lib/validate-esp-idf-lib-component.git
cd validate-esp-idf-lib-component
bundle
```

Clone the target repo to validate. The cloned directory name must be `repo`.

```sh
git clone https://github.com/esp-idf-lib/$COMPONENT_NAME repo
```

```sh
bundle exec rake spec
```

A successful output looks like below:

``text
..

Finished in 0.00405 seconds (files took 0.10226 seconds to load)
2 examples, 0 failures
```

A failed output looks like below:

```text
.F

Failures:

  1) idf_component.yml has the same targets except esp8266
     Failure/Error: expect(targets).to eq targets_eil

       expected: ["esp32", "esp32c2", "esp32c3", "esp32c5", "esp32c6", "esp32c61", "esp32h2", "esp32p4", "esp32s2", "esp32s3", "foo"]
            got: ["esp32", "esp32c2", "esp32c3", "esp32c5", "esp32c6", "esp32c61", "esp32h2", "esp32p4", "esp32s2", "esp32s3"]

       (compared using ==)
     # ./spec/idf_component_yml_spec.rb:17:in `block (2 levels) in <top (required)>'

Finished in 0.01554 seconds (files took 0.1026 seconds to load)
2 examples, 1 failure

Failed examples:

rspec ./spec/idf_component_yml_spec.rb:13 # idf_component.yml has the same targets except esp8266

/usr/local/bin/ruby32 -I/usr/home/trombik/.bundle/ruby/3.2/gems/rspec-core-3.13.5/lib:/usr/home/trombik/.bundle/ruby/3.2/gems/rspec-support-3.13.4/lib /usr/home/trombik/.bundle/ruby/3.2/gems/rspec-core-3.13.5/exe/rspec --pattern spec/\*\*\{,/\*/\*\*\}/\*_spec.rb failed
```
