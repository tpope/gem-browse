require 'rubygems/edit/command'

class Gem::Commands::EditCommand < Gem::Edit::Command

  def description
    <<-EOF
The edit command looks through the require paths of each gem for the
specified library file and loads said file in your editor.  If no file is
found, $LOAD_PATH is searched before giving up.
    EOF
  end

  def initialize
    super 'edit', 'Edit a library file you can require'
    add_editor_option
  end

  def execute
    unless Gem::Specification.respond_to?(:find_by_path)
      $stderr.puts "RubyGems >= 1.8.0 is required to use gem edit."
      terminate_interaction 1
    end

    specs = options[:args].map do |lib|
      [lib, Gem::Specification.find_by_path(lib)]
    end

    paths = specs.map do |(lib, spec)|
      if spec
        find(lib, spec.require_paths.map {|p| File.join(spec.full_gem_path, p)})
      else
        find(lib, $LOAD_PATH)
      end
    end.compact

    gemspecs = specs.map {|s| s.last}.compact.uniq
    dir = if gemspecs.size == 1
            gemspecs.first.full_gem_path
          else
            File.join(Gem.dir, 'gems')
          end

    unless paths.empty?
      Dir.chdir(dir) do
        edit(*paths)
      end
    end
  end

  # Adapted from Gem::Commands::WhichCommand
  def find(lib, paths)
    paths.each do |path|
      Gem.suffixes.each do |ext|
        full_path = File.join(path, "#{lib}#{ext}")
        if File.exist?(full_path) && !File.directory?(full_path)
          return full_path
        end
      end
    end

    alert_warning("Could not find #{lib.inspect} in any require path.")
  end

end
