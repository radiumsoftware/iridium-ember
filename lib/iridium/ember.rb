require 'iridium'
require 'iridium/ember/version'

module Iridium
  module Ember
    class PrecompilerError < Error
      def initialize(template, error)
        @template, @error = @template, error
      end

      def to_s
        "Pre compilation failed for: #{@template}\n. Compiler said: #{@error}"
      end
    end
  end
end

require 'iridium/ember/handlebars_precompiler'
require 'iridium/ember/handlebars_file_compiler'
require 'iridium/ember/inline_handlebars_compiler'
require 'iridium/ember/engine'
