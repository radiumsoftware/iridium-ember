module Iridium
  module Ember
    class InlineHandlebarsPrecompiler
      class << self
        def call(template)
          "Ember.Handlebars.template(#{compile(template)})"
        end

        def compile(template)
          HandlebarsPrecompiler.compile template
        end
      end
    end

    class HandlebarsFilePrecompiler < InlineHandlebarsPrecompiler
      class << self
        def call(template)
          "#{super};"
        end
      end
    end
  end
end

