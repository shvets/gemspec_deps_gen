require 'bundler'
require 'file_utils'

class GemspecDepsGen
  include FileUtils

  def bundler_gems group
    Bundler.environment.dependencies.select { |d| d.groups.include?(group) }.collect
  end

  def generate_dependencies source, target
    include_dependencies = generate_included_dependencies

    write_to_file(execute_template(source, binding), target)
  end

  def generate_included_dependencies
    text = ""

    bundler_gems(:default).each do |gem|
      text += "spec.add_runtime_dependency \"#{gem.name}\", #{gem.requirements_list}\n  "
    end

    bundler_gems(:development).each do |gem|
      text +="spec.add_development_dependency \"#{gem.name}\", #{gem.requirements_list}\n  "
    end

    text
  end
end
