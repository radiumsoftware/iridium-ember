module Iridium
  module Ember
    class HandlebarsPrecompiler < ::Barber::Ember::Precompiler
      def initialize(app = Iridium.application)
        @app = app
      end

      def handlebars
        raise "Cannot find handlebars.js file!" unless handlebars_file

        @handlebars ||= File.new(handlebars_file)
      end

      def handlebars_file
        @handlebars_file ||= @app.handlebars_path
      end

      def ember_template_precompiler
        raise "Cannot find ember precompiler" unless ember_template_compiler_file

        @ember_template_compiler ||= File.new(ember_template_compiler_file)
      end

      def ember_template_compiler_file
        @ember_template_compiler_file ||= @app.ember_template_compiler_path
      end
    end
  end
end
