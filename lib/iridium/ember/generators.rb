module Iridium
  module Ember
    class Generator < Iridium::Generator
      def self.base_root
        File.expand_path "../../../../generators", __FILE__
      end
    end
  end
end

require 'iridium/ember/generators/application_generator'
