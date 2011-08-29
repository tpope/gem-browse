require 'rubygems/browse/command'
require 'rubygems/version_option'

class Gem::Commands::OpenCommand < Gem::Browse::Command
  include Gem::VersionOption

  def initialize
    super 'open', 'Open a gem in your editor', :version => '>= 0'
    add_editor_option
    add_version_option
  end

  def execute
    name = get_one_gem_name
    gemspec = find_by_name(name, options[:version])
    Dir.chdir(gemspec.full_gem_path) do
      edit(gemspec.full_gem_path)
    end
  rescue Gem::LoadError
    alert_error "Could not find a valid gem #{name} (#{options[:version]})"
    terminate_interaction 1
  end

end
