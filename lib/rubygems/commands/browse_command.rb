require 'rubygems/edit/command'

class Gem::Commands::BrowseCommand < Gem::Edit::Command

  def initialize
    super 'open', "Open a gem's homepage in your web browser"
  end

  def execute
    name = get_one_gem_name
    homepage =
      begin
        find_by_name(name).homepage
      rescue Gem::LoadError
        get_json(name)[/"homepage_uri":\s*"([^"]*)"/, 1]
      end
    if homepage.to_s.empty?
      alert_warning "Gem '#{name}' lacks a homepage."
    elsif !system('git', 'web--browse', homepage)
      alert_error('Error starting web browser (using git web--browse).')
      terminate_interaction 1
    end
  end

end
