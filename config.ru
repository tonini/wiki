require "gollum/frontend/app"

Precious::App.set(:gollum_path, File.dirname(__FILE__))
Precious::App.set(:wiki_options, :base_path => File.expand_path('~/wiki'))
run Precious::App
