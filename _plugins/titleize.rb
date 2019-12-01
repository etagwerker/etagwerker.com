require "titleize"

module Jekyll
  module TitleizeFilter
    def titleize(input)
      input.to_s.titleize
    end
  end
end

Liquid::Template.register_filter(Jekyll::TitleizeFilter)
