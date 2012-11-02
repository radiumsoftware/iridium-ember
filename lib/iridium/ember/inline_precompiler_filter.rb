module Iridium
  module Ember
    class InlinePrecompilerFilter < ::Rake::Pipeline::Filter
      def generate_output(inputs, output)
        inputs.each do |input|
          compiled_content = input.read.gsub /((?:Ember|Em)\.Handlebars\.compile)\(['"](.+)['"]\)/ do
            Iridium::Ember::InlineHandlebarsPrecompiler.call $1
          end

          output.write compiled_content
        end
      end
    end
  end
end
