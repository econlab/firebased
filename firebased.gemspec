# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'firebased/version'

Gem::Specification.new do |spec|
  spec.name          = "firebased"
  spec.version       = Firebased::VERSION
  spec.authors       = ["Miles Zimmerman"]
  spec.email         = ["miles@maztek.io"]
  spec.summary       = %q{Deploy and manage Firebase instances programatically}
  spec.description   = %q{A ruby gem to deploy and manage Firebase instances programaticaly. Based off of firebase-admin by casetext.}
  spec.homepage      = "https://github.com/econlab/firebased"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"

  spec.add_dependency "faraday"
  spec.add_dependency "json"
end
