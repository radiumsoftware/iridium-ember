module Iridium
  module Ember
    class Engine < Iridium::Engine
      config.dependencies.insert_after :jquery, :ember

      config.dependencies.skip "ember-template-compiler", "ember.min"

      config.handlebars.target = 'Ember.TEMPLATES'

      config.handlebars.compiler = proc { |source|
        "Ember.Handlebars.compile(#{source});"
      }
    end
  end
end
