Gem::Specification.new do |s|
  s.name        = "blog"
  s.version     = "1.0.0"
  s.summary     = "Fast Ruby Blog"
  s.email       = ["hello@ombulabs.com"]
  s.authors     = ["OmbuLabs"]
  s.files       = Dir["_site/**/*"]
  s.homepage    = "https://github.com/fastruby/blog"
  s.license     = "MIT"

  s.add_dependency('rake', '~> 12.3')
  s.add_dependency('minima')
  s.add_dependency('jekyll', '~> 4.0.0')
  s.add_dependency('sitemap_generator')
  s.add_dependency('dotenv')
  s.add_dependency('rspec')

  s.add_dependency('rouge')
  s.add_dependency('redcarpet')
end
