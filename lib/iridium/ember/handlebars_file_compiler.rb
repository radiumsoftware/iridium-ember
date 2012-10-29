module Iridium
  module Ember
    class HandlebarsFileCompiler
      class << self
        def call(template)
          "Ember.Handlebars.template(#{compile(template)});"
        end

        def compile(template)
          HandlebarsPrecompiler.compile template
        end
      end
    end
  end
end
