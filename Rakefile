require 'bundler/setup'
Bundler.require(:default, 'test')

require_relative 'lib/application'

require 'rake/testtask'

Rake::TestTask.new(:test) do |test|
  test.libs << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end
