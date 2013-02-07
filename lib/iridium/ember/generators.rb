module Iridium
  module Ember
    class Generator < Iridium::Generator
      namespace :ember

      def self.base_root
        File.expand_path "../../../../generators", __FILE__
      end

      self.source_paths << "#{base_root}/#{namespace}/shared"

      no_tasks do
        def nested?
          file_name.include?(".") || file_name.include?("/")
        end

        def folder_name
          file_name.gsub(".", "/").underscore
        end

        def namespaced_file_name
          if nested?
            folders = folder_name.split("/")
            file_name = folders.pop

            "#{folders.join("/")}/#{file_name}"
          else
            underscored_file_name
          end
        end

        def js_name
          file_name.gsub /[.\/]+/, '_'
        end

        def camelized_class_name
          js_name.camelize
        end

        def underscored_file_name
          js_name.underscore
        end
      end
    end
  end
end

require 'iridium/ember/generators/application_generator'
require 'iridium/ember/generators/route_generator'
require 'iridium/ember/generators/controller_generator'
require 'iridium/ember/generators/view_generator'
require 'iridium/ember/generators/template_generator'
require 'iridium/ember/generators/helper_generator'
