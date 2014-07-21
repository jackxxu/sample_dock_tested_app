require 'bundler/setup'
Bundler.require(:default, ENV['RACK_ENV'])

require_relative 'lib/application'

run Application.new
