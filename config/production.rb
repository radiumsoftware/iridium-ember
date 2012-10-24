Iridium::Ember::Engine.configure do
  config.dependencies.swap :handlebars, "handlebars-runtime"

  js do |pipeline|
    pipeline.strip %r{^(\s)*Ember\.(assert|deprecate|warn)\((.*)\).*$}
  end
end
