module Iridium
  class Application
    def ember_template_compiler_path
      base = paths[:vendor].expanded.find do |path|
        File.exists? File.join(path, "javascripts", "ember-template-compiler.js")
      end

      return unless base

      File.join base, "javascripts", "ember-template-compiler.js"
    end
  end
end
