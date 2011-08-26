# Wiki

This is my personal wiki which is running under [gollum](https://github.com/github/gollum)

## How set up your own wiki

Gollum is a great Git-powered wiki with a nice and shiny frontend. To set it up to running under [pow](https://github.com/37signals/pow) there are just a few steps needed.

First create a new directory for your new wiki and create an empty git repository in it.

    $ mkdir ~/wiki
    $ cd ~/wiki
    $ git init

Use [rvm](https://github.com/wayneeseguin/rvm) to create a gemset to keep all together and seperated.

    $ rvm gemset create wiki
    $ echo 'rvm <your-ruby-version>@wiki' > .rvmrc

Get [bundler](https://github.com/carlhuda/bundler) and create a new gemfile

    $ gem install bundler

Into the gemfile you put:

    source "http://rubygems.org"

    gem 'gollum'
    gem 'powder' # a great pow cli

Install the gems

    $ bundle install # ([more info](http://gembundler.com/bundle_install.html))

Create a config.ru file with the following content

    require "gollum/frontend/app"

    Precious::App.set(:gollum_path, File.dirname(__FILE__))
    Precious::App.set(:wiki_options, :base_path => File.expand_path('~/wiki'))
    run Precious::App

If you want to have your wiki posts in a different branch than the master branch, just add the following to the wiki options

    Precious::App.set(:wiki_options, :refs => 'your_branch_name')

If you not already have installed pow just run

    $ powder install

Ready to take off, run [powder](https://github.com/Rodreegez/powder) and your in!

    $ powder # Your application is now available at http://wiki.dev/

## Links

[gollum](https://github.com/github/gollum) - A simple, git powered wiki with a sweet API and local frontend

[rvm](https://github.com/wayneeseguin/rvm) - Ruby version manager

[bundler](https://github.com/carlhuda/bundler) - A tool that manages gem dependencies for your ruby application

[pow](https://github.com/37signals/pow) - Zero-configuration Rack server for Mac OS X

[powder](https://github.com/Rodreegez/powder) - a great pow command line interface
