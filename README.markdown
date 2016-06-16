gem-browse
==========

Open a library file you can require in your editor.  That's it.

    gem edit active_support/all
    gem edit rake/task thor/task
    gem edit -e mvim fileutils

Actually that's not it.  You can also open a gem by name.

    gem open bundler

Your editor's current working directory will be the root of the gem.

I almost forgot.  You can also clone a gem from GitHub.

    gem clone rails
    gem clone -d ~/src capybara

And you can tell it to open the gem in your editor afterwards.

    gem clone -o rack
    gem clone -oe mvim -d /tmp gem-browse

This one doesn't work if the neither the homepage nor the source code
URL point back at GitHub.

That's really it.  I mean other than the command that lets you open a
gem's homepage in your browser.  You know, the command this gem is named
after.

    gem browse sprockets

Installation
------------

RubyGems 1.8 is required to use `gem edit`, but the other commands will
work on any version that supports RubyGems plugins.

    gem install gem-browse

If you're using RVM, you can put it in the global gemset (relax, it has
no dependencies):

    echo gem-browse >> ~/.rvm/gemsets/global.gems
    rvm @global do gem install gem-browse

Protip:  Install [gem-ctags](https://github.com/tpope/gem-ctags) to
automatically invoke [Ctags](http://ctags.sourceforge.net/) on gems as
they are installed.

Bash Completion
---------------

Yep, we've got that. Just add the following to your `.bashrc`:

    _gem_browse() {

        local subcmd cur

        COMPREPLY=()
        subcmd=${COMP_WORDS[1]}
        cur=${COMP_WORDS[COMP_CWORD]}

        case "$subcmd" in
            browse|clone|edit|open)
                words=`ruby -rubygems -e 'puts Dir["{#{Gem::Specification.dirs.join(",")}}/*.gemspec"].collect { |s| File.basename(s).gsub(/-(\d+.)+gemspec$/, "")}'`
                ;;
            *)
                return
                ;;
        esac

        COMPREPLY=($(compgen -W "$words" -- $cur))
        return 0
    }

    complete -o default -F _gem_browse gem

Now when you type `gem edit <Tab>` you'll see a list of your installed gems.

Contributing
------------

Don't submit a pull request with [an ugly commit
message](http://stopwritingramblingcommitmessages.com) or I will ignore
your patch until I have the energy to politely explain my zero tolerance
policy.

License
-------

Copyright (c) Tim Pope.  MIT License.
