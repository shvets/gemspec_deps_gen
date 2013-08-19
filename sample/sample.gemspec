Gem::Specification.new do |spec|
  spec.name = "sample"
  spec.summary = %q{Summary.}
  spec.description = %q{Description.}
  spec.email = "alexander.shvets@gmail.com"
  spec.authors = ["Alexander Shvets"]
  spec.homepage = "http://github.com/shvets/sample"

  spec.files = `git ls-files`.split($\)
  spec.test_files = spec.files.grep(%r{^(test|spec|features)/})

  spec.version = "1.0.0"
  
  spec.add_runtime_dependency "bundler", [">= 0"]
  spec.add_runtime_dependency "file_utils", [">= 0"]
  spec.add_development_dependency "gemcutter", [">= 0"]

end

