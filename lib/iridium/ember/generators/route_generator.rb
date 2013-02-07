module Iridium
  module Ember
    module Generators
      class RouteGenerator < Iridium::Ember::Generator
        namespace 'ember'

        desc "Generate an Ember.js Route"

        argument :route_name, :type => :string

        class_option :route, :type => :boolean, :aliases => '-r', :default => false
        class_option :controller, :type => :boolean, :alias => '-c', :default => false
        class_option :view, :type => :boolean, :aliases => '-v', :default => false
        class_option :full, :type => :boolean, :aliases => '-a', :default => false

        def route
          template "route.coffee.tt", "app/javascripts/#{namespaced_file_name}.coffee"
          template "template.hbs.tt", "app/templates/#{namespaced_file_name}.hbs"

          template "stylesheet.scss.tt", "app/stylesheets/#{namespaced_file_name}.scss"

          if options[:controller] || options[:full]
            template "controller.coffee.tt", "app/javascripts/controllers/#{namespaced_file_name}_controller.coffee"
          end

          if options[:view] || options[:full]
            template "view.coffee.tt", "app/javascripts/views/#{namespaced_file_name}_view.coffee"
          end

          if options[:route] || options[:full]
            template "route.coffee.tt", "app/javascripts/routes/#{namespaced_file_name}_route.coffee"
          end
        end

        no_tasks do
          def file_name
            route_name
          end
        end
      end
    end
  end
end
