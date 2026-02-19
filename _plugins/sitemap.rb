require "sitemap_generator"

Jekyll::Hooks.register :site, :post_write do |site|
  puts "Generating sitemap.xml"

  dest = site.dest

  files = Dir["#{dest}/**/*.html"]

  # Pages to exclude from the sitemap entirely
  exclude_patterns = [
    /\/404\.html$/,
    /\/google[a-z0-9]+\.html$/,  # Google verification files
  ]

  # Always generate absolute URLs using the canonical HTTPS domain
  SitemapGenerator::Sitemap.default_host = "https://etagwerker.com"
  SitemapGenerator::Sitemap.public_path = dest
  SitemapGenerator::Sitemap.create compress: false do
    files.each do |file|
      relative_path = file.sub(/^#{Regexp.escape(dest)}/, "")

      # Skip excluded pages
      next if exclude_patterns.any? { |pattern| relative_path.match?(pattern) }

      # Normalize /path/index.html to /path/ to avoid duplicate entries
      url_path = relative_path.sub(/\/index\.html$/, "/")

      # Skip the root /index.html since SitemapGenerator auto-adds /
      next if url_path == "/"

      # Determine priority and changefreq based on page type
      if url_path =~ /\/page\d+\//
        # Pagination pages: low priority
        priority = 0.3
        freq = "weekly"
      elsif url_path =~ /\/authors\//
        priority = 0.3
        freq = "monthly"
      else
        # Blog posts and content pages
        priority = 0.7
        freq = "monthly"
      end

      add url_path, changefreq: freq, priority: priority
    end
  end

  puts "Generated sitemap.xml"
end
