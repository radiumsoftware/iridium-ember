module Iridium
  module Ember
    module Generators
      class ApplicationGenerator < Iridium::Ember::Generator
        namespace 'ember'

        desc "Generate an ember.js application structure"
        def application
          directory "app"
          directory "vendor"
        end
      end
    end
  end
end
