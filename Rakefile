#!/usr/bin/env rake

$LOAD_PATH.unshift File.expand_path("lib", File.dirname(__FILE__))

require "rspec/core/rake_task"
require "gemspec_deps_gem/version"

def version
  GemspecDepsGem::VERSION
end
  
def project_name
  File.basename(Dir.pwd)
end
  
task :build do
  system "gem build #{project_name}.gemspec"
end

task :release => :build do
  system "gem push #{project_name}-#{version}.gem"
end

RSpec::Core::RakeTask.new do |task|
  task.pattern = 'spec/**/*_spec.rb'
  task.verbose = false
end


