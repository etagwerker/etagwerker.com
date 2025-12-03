require 'html-proofer'

task :find_dead_links do
  opts = { only_4xx: true, url_ignore: [/blog/, /#content/] }
  begin
    HTMLProofer.check_directory("./_site", opts).run
  rescue => e
  end
end

task :generate_sitemap do
  require "sitemap_generator"

  SitemapGenerator::Sitemap.default_host = "https://etagwerker.com"
  SitemapGenerator::Sitemap.public_path = "_site"
  SitemapGenerator::Sitemap.create do
    add "/", changefreq: "daily", priority: 1.0
  end
end