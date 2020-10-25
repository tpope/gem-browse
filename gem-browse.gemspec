# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "gem-browse"
  s.version     = "1.0.0"
  s.authors     = ["Tim Pope"]
  s.email       = ["ruby@tpop"+'e.org']
  s.homepage    = "https://github.com/tpope/gem-browse"
  s.summary     = %q{gem edit, gem open, gem clone, gem browse}
  s.description = <<-EOS
gem edit: edit a library file you can require.
gem open: edit a gem by name.
gem clone: clone a gem from GitHub.
gem browse: open a gem's homepage in your browser.
  EOS
  s.license     = 'MIT'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency('rake', '~> 13.0.1')
end
