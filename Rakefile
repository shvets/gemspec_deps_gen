#!/usr/bin/env rake

$LOAD_PATH.unshift File.expand_path("lib", File.dirname(__FILE__))

require "gemspec_deps_gen/version"

def version
  GemspecDepsGen::VERSION
end
  
def project_name
  File.basename(Dir.pwd)
end
  
task :build do
  system "gem build #{project_name}.gemspec"
end

task :install do
  system "gem install #{project_name}-#{version}.gem"
end

task :release => :build do
  system "gem push #{project_name}-#{version}.gem"
end



