ENV['RACK_ENV'] = 'test'

require 'minitest/autorun'
require 'dock_test'

# the following block sets the DockTest configuration
# if many environment is involved, a services.yml file may organize things better.
DockTest.configure do |c|
  c.url = case ENV['DOCK_ENV']
          when 'production'
            'http://vast-reaches-9635.herokuapp.com/'
          else
            'http://localhost:9871'
          end
  c.skippy = :production
end

# the following setting is specific to enable guard-jruby-minitest
# for the excellent Newark framework and can be safely ignored
# if you only are interested in knowing how DockTest
if defined?(::Guard)
  class NewarkReloader
    def self.run(*)
      routes = Application.instance_variable_get(:@routes)
      routes.each do |verb, route_array|
        route_set = {}.tap do |rset|
          route_array.each {|route| rset[route.instance_variable_get(:@path).to_s] = route}
        end
        routes[verb] = route_set.values
      end
      Application.instance_variable_set(:@routes, routes)
    end
  end

  unless Guard::JRubyMinitest.reloaders.include?(NewarkReloader)
    Guard::JRubyMinitest.reloaders << NewarkReloader
    Application.class_eval do
      def call(env)
        # add the following line to copy the class variable to instance variable
        @routes = self.class.instance_variable_get(:@routes)
        dup._call(env)
      end
    end
  end
end
