require "sitemap_generator"

Jekyll::Hooks.register :site, :post_write do |site|
  puts "Generating sitemap.xml"

  dest = site.dest

  files = Dir["#{dest}/**/*.html"]

  # Always generate absolute URLs using the canonical HTTPS domain
  SitemapGenerator::Sitemap.default_host = "https://etagwerker.com"
  SitemapGenerator::Sitemap.public_path = dest
  SitemapGenerator::Sitemap.create compress: false do
    files.each do |file|
      add file.sub(/^#{Regexp.escape(dest)}/, ""), changefreq: "weekly"
    end
  end

  puts "Generated sitemap.xml"

  puts "All done!"
end
