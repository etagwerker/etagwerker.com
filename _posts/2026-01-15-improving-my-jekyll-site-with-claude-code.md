---
layout: post
title: "Improving My Jekyll Site with Claude Code"
description: "How I used Claude Code to fix SEO issues, add Google Analytics 4, and set up GitHub Actions for my personal website in a single session."
date: 2026-01-15
keywords: [claude code, jekyll, github actions, pair programming]
slug: improving-my-jekyll-site-with-claude-code
---

Today I spent some time improving this website with the help of [Claude Code](https://claude.com/claude-code), Anthropic's CLI tool for software development. All the changes described in this article were authored by Claude Code with my direction.

<!--more-->

## The Starting Point

My Jekyll site had been running for years with several technical debt items I never got around to fixing. I decided to see how Claude Code could help me tackle these issues in a single session.

## SEO Improvements

Claude Code started by analyzing my site for common SEO issues and identified three critical problems:

### 1. Missing Meta Descriptions

My posts had `description` fields in their frontmatter, but the template wasn't rendering them as `<meta name="description">` tags. Claude Code added the necessary Liquid template code to `_includes/head.html`:

```liquid
{% raw %}{% if page.description %}
  <meta name="description" content="{{ page.description | strip_html | truncate: 160 }}">
{% elsif site.meta_description %}
  <meta name="description" content="{{ site.meta_description }}">
{% endif %}{% endraw %}
```

### 2. Missing Canonical URLs

Without canonical URLs, search engines might index multiple versions of the same content. Claude Code added:

```html
{% raw %}<link rel="canonical" href="{{ site.url }}{{ page.url }}">{% endraw %}
```

### 3. Missing Open Graph and Twitter Card Tags

When sharing posts on social media, they weren't displaying rich preview cards. Claude Code added complete Open Graph and Twitter Card meta tags, so now when you share a post on Twitter or LinkedIn, it displays a proper preview with the title and description.

## Git-Based Last Modified Dates

I wanted to show when pages were last updated on my [Now page](/now/). Claude Code created a Jekyll plugin that reads the git history to get the actual last modified date:

```ruby
Jekyll::Hooks.register :site, :post_read do |site|
  site.pages.each do |page|
    relative_path = page.relative_path
    next unless relative_path

    Dir.chdir(site.source) do
      git_date = `git log -1 --format="%ci" -- "#{relative_path}"`.strip
      if git_date && !git_date.empty?
        page.data['last_modified_at'] = Time.parse(git_date)
      end
    end
  end
end
```

## GitHub Actions Workflow

My site uses Jekyll 4.0 and custom plugins, which aren't supported by GitHub Pages' built-in Jekyll. Claude Code created a GitHub Actions workflow that:

- Builds the site with all custom plugins
- Fetches full git history (needed for the last modified dates plugin)
- Deploys the generated site to GitHub Pages

This was necessary because GitHub Pages' default Jekyll build doesn't support custom plugins like `sitemap_generator` or my new `last_modified` plugin.

## Google Analytics 4 Migration

The site was still using the deprecated Universal Analytics (ga.js). Claude Code replaced it with the modern GA4 gtag.js implementation.

## Site Branding Updates

I updated the site title from "Pivot or Persevere" to "Ernesto Tagwerker: Founder & CTO at OmbuLabs.ai" with proper descriptions. Claude Code helped identify that the title wasn't updating because:

1. The `index.html` had the old title hardcoded in its frontmatter
2. The `_config.yml` used `name` but the templates expected `site.title`

Both issues were fixed, and now the site has consistent branding throughout.

## The Experience

Working with Claude Code felt like pair programming with a knowledgeable colleague. I could describe what I wanted at a high level, and Claude Code would:

- Explore the codebase to understand the existing structure
- Identify the right files to modify
- Make the changes with proper context
- Commit with descriptive messages
- Push to GitHub

The entire session took about an hour, and we made 7 commits addressing issues that had been on my backlog for months.

## Conclusion

AI-assisted development tools like Claude Code are changing how we approach routine maintenance and improvements. Tasks that might have taken a full afternoon of context-switching between documentation, Stack Overflow, and code editors can now be completed in a focused conversation.

If you're curious about Claude Code, check it out at [claude.com/claude-code](https://claude.com/claude-code).

If you're [curious about AI and how it can help your engineering organization, contact OmbuLabs.ai](https://www.ombulabs.ai)!
