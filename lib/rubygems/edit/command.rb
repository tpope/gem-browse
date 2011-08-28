require 'rubygems/command'

module Gem::Edit
  class Command < Gem::Command

    def add_editor_option
      add_option('-e', '--editor EDITOR', 'Specify editor to invoke') do |editor, options|
        options[:editor] = editor
      end
    end

    def editor
      options[:editor] ||
        ENV['GEM_EDITOR'] ||
        ENV['VISUAL'] ||
        ENV['EDITOR'] ||
        'vi'
    end

    def edit(*args)
      unless system(*editor.split(/\s+/) + args)
        alert_error "Problem with editor #{editor}"
        terminate_interaction 1
      end
    end

  end
end
