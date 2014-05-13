# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'catch_json_parse_errors/version'

Gem::Specification.new do |spec|
  spec.name          = "catch_json_parse_errors"
  spec.version       = CatchJsonParseErrors::VERSION
  spec.authors       = ["Andrew Hammond"]
  spec.email         = ["andrew@tremorlab.com"]
  spec.summary       = %q{A Rack middleware for catching JSON parse errors and providing friendlier messages.}
  spec.description   = %q{A Rack middleware for catching JSON parse errors and providing friendlier messages.}
  spec.homepage      = "http://github.com/andrhamm"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
