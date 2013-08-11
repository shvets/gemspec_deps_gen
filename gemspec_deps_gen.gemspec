# -*- encoding: utf-8 -*-

require File.expand_path(File.dirname(__FILE__) + '/lib/gemspec_deps_gen/gemspec_deps_gen/version')

Gem::Specification.new do |spec|
  spec.name          = "gemspec_deps_gen"
  spec.summary       = %q{Class for generating gem dependencies from Gemfile }
  spec.description   = %q{Class for generating gem dependencies from Gemfile }
  spec.email         = "alexander.shvets@gmail.com"
  spec.authors       = ["Alexander Shvets"]
  spec.homepage      = "http://github.com/shvets/gemspec_deps_gen"

  spec.files         = `git ls-files`.split($\)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.version       = GemspecDepsGen::VERSION

  spec.executables = ["gemspec_deps_gen"]

  spec.add_dependency "file_utils", [">= 0"]
  spec.add_dependency "bundler", [">= 0"]
end

