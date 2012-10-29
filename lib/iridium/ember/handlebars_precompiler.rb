require 'JSON'

module Iridium
  module Ember
    class HandlebarsPrecompiler
      class << self
        def compile(source)
          # if the source is a prescaped JSON string then 
          # it should be parse, else just use it as is
          content = begin
                      JSON.load source
                    rescue JSON::ParserError
                      source
                    end

          context.call "IridiumEmber.precompile", content
        rescue ExecJS::ProgramError => ex
          raise PrecompilerError.new(source, ex)
        end

        def ember_path
          File.expand_path("../../../../vendor/javascripts/ember.js", __FILE__)
        end

        def handlebars_path
          File.expand_path("../javascripts/handlebars.js", __FILE__)
        end

        def precompiler_path
          File.expand_path("../javascripts/precompiler.js", __FILE__)
        end

        private
        def context
          @context ||= ExecJS.compile source
        end

        def source
          @source ||= [
            File.read(precompiler_path),
            File.read(handlebars_path),
            File.read(ember_path)
          ].join "\n"
        end
      end
    end
  end
end
