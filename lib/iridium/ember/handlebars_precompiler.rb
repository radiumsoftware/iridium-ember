require 'json'

module Iridium
  module Ember
    class HandlebarsPrecompiler < ::Barber::Ember::Precompiler
      def ember
        @ember ||= File.new(File.expand_path("../../../../vendor/javascripts/ember.js", __FILE__))
      end

      def handlebars
        @handlebars ||= File.new(File.expand_path("../javascripts/handlebars.js", __FILE__))
      end
    end
  end
end
