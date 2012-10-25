module Iridium
  module Ember
    class Engine < Iridium::Engine
      config.dependencies.load "ember-debug", :after => :jquery
      config.dependencies.skip :ember

      config.handlebars.target = 'Ember.TEMPLATES'

      config.handlebars.compiler = proc { |source|
        "Ember.Handlebars.compile(#{source});"
      }
    end
  end
end
