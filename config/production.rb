Iridium::Ember::Engine.configure do
  config.dependencies.swap "ember-debug", :ember

  config.handlebars.compiler = Iridium::Ember::HandlebarsPrecompiler

  js do |pipeline|
    pipeline.strip %r{^(\s)*Ember\.(assert|deprecate|warn)\((.*)\).*$}
  end

  js do |pipeline|
    pipeline.replace /(Ember\.Handlebars\.compile)\(['"](.+)['"]\)/ do |foo, _, template|
      Iridium::Ember::HandlebarsPrecompiler.call template
    end
  end
end
