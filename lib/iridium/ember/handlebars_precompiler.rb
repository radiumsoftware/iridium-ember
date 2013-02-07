module Iridium
  module Ember
    class HandlebarsPrecompiler < ::Barber::Ember::Precompiler
      def initialize(app = Iridium.application)
        @app = app
      end

      def handlebars
        @handlbars ||= File.new(@app.ember_template_compiler_path)
      end
    end
  end
end
