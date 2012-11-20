Iridium::Ember::Engine.configure do
  config.handlebars.compiler = Iridium::Ember::HandlebarsFilePrecompiler

  config.handlebars.inline_compiler = Iridium::Ember::InlinePrecompilerFilter

  js do |pipeline|
    pipeline.strip %r{^\s*(Ember|Em)\.(assert|deprecate|warn)\((.*)\).*$}
  end
end
