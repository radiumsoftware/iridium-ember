module Iridium
  module Ember
    class HandlebarsPrecompiler < ::Barber::Ember::Precompiler
      def initialize(app = Iridium.application)
        @app = app
      end

      def ember
        @ember ||= File.new(ember_path)
      end

      def handlebars
        @handlbars ||= File.new(@app.handlebars_path)
      end

      def ember_path
        @app.ember_path || File.expand_path("../../../../vendor/javascripts/ember.js", __FILE__)
      end
    end
  end
end
