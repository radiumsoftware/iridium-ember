module Iridium
  module Ember
    module Generators
      class HelperGenerator < Iridium::Ember::Generator
        namespace 'ember'

        desc "Generate an Ember.js bound helper"

        argument :helper_name, :type => :string

        def helper
          template "helper.coffee.tt", "app/javascripts/helpers/#{namespaced_file_name}_helper.coffee"
        end

        no_tasks do
          def file_name
            helper_name
          end

          def ember_helper_name
            str = camelized_class_name
            str[0] = str[0].downcase
            str
          end

          def helper_class
            js_name.dasherize
          end
        end
      end
    end
  end
end
