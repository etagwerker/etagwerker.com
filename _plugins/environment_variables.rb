require 'dotenv'

module Jekyll
  class EnvironmentVariablesGenerator < Generator
    priority :highest

    # Sets the env variables that we need in the site configuration
    def generate(site)
      Dotenv.load
      site.config["google_analytics"] = "UA-9318740-1"
    end
  end
end
