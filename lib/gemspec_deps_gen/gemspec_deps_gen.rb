require 'bundler'
require 'file_utils'

class GemspecDepsGen
  include FileUtils

  def bundler_gems group
    Bundler.environment.dependencies.select { |d| d.groups.include?(group) }.collect
  end

  def generate_dependencies spec_name, source, target
    project_dependencies = generate_project_dependencies spec_name

    if target
      write_content_to_file(execute_template(source, binding), target)
    else
      puts project_dependencies
    end
  end

  def generate_project_dependencies spec_name
    text = "\n"

    bundler_gems(:default).each do |gem|
      text += "  #{spec_name}.add_runtime_dependency \"#{gem.name}\", #{gem.requirements_list}\n"
    end

    bundler_gems(:development).each do |gem|
      text +="  #{spec_name}.add_development_dependency \"#{gem.name}\", #{gem.requirements_list}\n"
    end

    text
  end
end
