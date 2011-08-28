gem-edit
========

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

And tell it to open the gem in your editor afterwards.

    gem clone -o rack
    gem clone -oe mvim -d /tmp gem-edit

This one doesn't work if the neither the homepage nor the source code
URL point back at GitHub.

Installation
------------

RubyGems 1.8 is required to use `gem edit` itself, but the other
commands will work on any version that supports RubyGems plugins.

    gem install gem-edit

If you're using RVM, you can put it in the global gemset (relax, it has
no dependencies):

    echo gem-edit >> ~/.rvm/gemsets/global.gems
    rvm @global gem install gem-edit

Protip:  Install [gem-ctags](https://github.com/tpope/gem-ctags) to
automatically invoke [Ctags](http://ctags.sourceforge.net/) on gems as
they are installed.

Contributing
------------

Don't submit a pull request with [an ugly commit
message](http://stopwritingramblingcommitmessages.com) or I will ignore
your patch until I have the energy to politely explain my zero tolerance
policy.

License
-------

Copyright (c) Tim Pope.  MIT License.
