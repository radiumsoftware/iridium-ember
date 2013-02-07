Iridium::Ember::Engine.configure do
  config.handlebars.compiler = Iridium::Ember::HandlebarsFilePrecompiler

  config.handlebars.inline_compiler = Iridium::Ember::InlinePrecompilerFilter

  config.dependencies.swap :ember, 'ember.min'

  js do |pipeline|
    pipeline.strip %r{^\s*(Ember|Em)\.(assert|deprecate|warn|debug)\((.*)\).*$}
  end
end
