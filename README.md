# gemspec_deps_gen
# gem for generating project dependencies inside gemspec file

## Installation

Add this line to to your Gemfile:

    gem "gemspec_deps_gen"

And then execute:

    $ bundle

## Usage

Create <project_name>.gemspec.erb file:

```ruby
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

  <%= project_dependencies %>
end

```

You can see ERB fragment (project_dependencies) included inside the body of the specification.

Now, run this command:


```bash
$ gemspec_deps_gen <project_name>
```

It will generate <project_name>.gemspec and replace ERB fragment with dependencies from Gemfile:


```ruby
Gem::Specification.new do |spec|
  ...

  spec.add_runtime_dependency "bundler", [">= 0"]
  spec.add_runtime_dependency "file_utils", [">= 0"]
  spec.add_development_dependency "gemcutter", [">= 0"]

end
```

As alternative, you can call it as rake command:

```rake
require "gemspec_deps_gen"

project_name = <your project name>

task :gen do
  generator = GemspecDepsGen.new project_name

  generator.generate_dependencies "spec", "#{project_name}.gemspec.erb", "#{project_name}.gemspec"
end
```

```bash
$ rake gen
```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

