module Iridium
  class Application
    def ember_path
      base = paths[:vendor].expanded.find do |path|
        File.exists? File.join(path, "javascripts", "ember.js")
      end

      return unless base

      File.join base, "javascripts", "ember.js"
    end
  end
end
