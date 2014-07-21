require 'bundler/setup'
Bundler.require(:default, ENV['RACK_ENV'])

require 'lib/application'

run Application.new
