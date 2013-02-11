module Iridium
  module Ember
    module Generators
      class TripleGenerator < Iridium::Ember::Generator
        namespace 'ember'

        desc "Generate an Ember.js triple (controller, template, view)"

        argument :triple_name, :type => :string

        def triple
          template "template.hbs.tt", "app/templates/#{namespaced_file_name}.hbs"
          template "controller.coffee.tt", "app/javascripts/controllers/#{namespaced_file_name}_controller.coffee"
          template "view.coffee.tt", "app/javascripts/views/#{namespaced_file_name}_view.coffee"
        end

        no_tasks do
          def file_name
            triple_name
          end
        end
      end
    end
  end
end
