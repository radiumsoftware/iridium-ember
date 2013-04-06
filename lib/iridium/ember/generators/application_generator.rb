module Iridium
  module Ember
    module Generators
      class ApplicationGenerator < Iridium::Ember::Generator
        namespace 'ember'

        desc "Generate an ember.js application structure"
        def application
          directory "app"

          %w(ember.js ember.min.js ember-template-compiler.js).each do |path|
            create_file "vendor/javascripts/#{path}" do
              ::Ember::Source.bundled_path_for(path)
            end
          end
        end
      end
    end
  end
end
