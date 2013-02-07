module Iridium
  module Ember
    module Generators
      class TemplateGenerator < Iridium::Ember::Generator
        namespace 'ember'

        desc "Generate an Ember.js Handblebars template"

        argument :template_name, :type => :string

        # So the generate can be called template.
        alias original_template template

        def template
          original_template "template.hbs.tt", "app/templates/#{namespaced_file_name}.hbs"
        end

        no_tasks do
          def file_name
            template_name
          end
        end
      end
    end
  end
end
