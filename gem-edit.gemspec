# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "gem-edit"
  s.version     = "1.0.0"
  s.authors     = ["Tim Pope"]
  s.email       = ["ruby@tpop"+'e.org']
  s.homepage    = "https://github.com/tpope/gem-edit"
  s.summary     = %q{gem edit, gem open, gem clone}
  s.description = <<-EOS
gem edit: open a library file you can require.
gem open: open a gem by name.
gem clone: clone a gem from GitHub.
  EOS

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency('rake', '~> 0.8')
end
