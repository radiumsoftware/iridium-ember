module Iridium
  module Ember
    module Generators
      class ControllerGenerator < Iridium::Ember::Generator
        namespace 'ember'

        desc "Generate an Ember.js Route"

        argument :controller_name, :type => :string

        def controller
          template "controller.coffee.tt", "app/javascripts/controllers/#{namespaced_file_name}_controller.coffee"
        end

        no_tasks do
          def file_name
            controller_name
          end
        end
      end
    end
  end
end
