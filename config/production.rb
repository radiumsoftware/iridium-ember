Iridium::Ember::Engine.configure do
  config.dependencies.swap :handlebars, "handlebars-runtime"

  config.handlebars.compiler = Iridium::Ember::HandlebarsPrecompiler

  js do |pipeline|
    pipeline.strip %r{^(\s)*Ember\.(assert|deprecate|warn)\((.*)\).*$}
  end
end
