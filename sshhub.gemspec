# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sshhub/version'

Gem::Specification.new do |spec|
  spec.name          = "sshhub"
  spec.version       = Sshhub::VERSION
  spec.authors       = ["Matthew Werner"]
  spec.email         = ["m@mjw.io"]
  spec.summary       = %q{sshhub is an easy way to get ssh keys authorized on your public server}
  spec.description   = spec.summary
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'thor',    '~> 0.19'
  spec.add_dependency 'octokit', '~> 3.1'

  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'bundler',   '~> 1.6'
  spec.add_development_dependency 'simplecov', '~> 0.7'
  spec.add_development_dependency 'rspec',     '~> 2.13'
end
