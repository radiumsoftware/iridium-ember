module Iridium
  module Ember
    module Generators
      class ViewGenerator < Iridium::Ember::Generator
        namespace 'ember'

        desc "Generate an Ember.js View class"

        argument :view_name, :type => :string

        def view
          template "view.coffee.tt", "app/javascripts/views/#{namespaced_file_name}_view.coffee"
        end

        no_tasks do
          def file_name
            view_name
          end
        end
      end
    end
  end
end
