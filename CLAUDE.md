# CLAUDE.md

This file provides context for Claude Code when working on this repository.

## Project Overview

This is a personal Jekyll website for Ernesto Tagwerker (etagwerker.com). It uses Jekyll 4.0 with the Hyde theme (based on Poole).

## Tech Stack

- **Static Site Generator**: Jekyll 4.0
- **Theme**: Hyde (Poole-based)
- **Hosting**: GitHub Pages
- **Deployment**: GitHub Actions (custom workflow for Jekyll 4.0 + plugins)
- **Analytics**: Google Analytics 4 (gtag.js)

## Directory Structure

- `_posts/` - Blog posts (Markdown)
- `_includes/` - Reusable HTML partials (head.html, sidebar.html, site_footer.html)
- `_layouts/` - Page layouts (default.html, page.html, post.html)
- `_plugins/` - Custom Jekyll plugins (last_modified.rb)
- `assets/` - CSS, images, and other static assets
- `public/` - Generated output directory (in .gitignore)

## Key Files

- `_config.yml` - Jekyll configuration
- `feed.xml` - RSS feed template
- `.github/workflows/jekyll.yml` - GitHub Actions deployment workflow

## Common Tasks

### Local Development

```bash
bundle exec jekyll serve
```

The site will be available at http://localhost:4000

### Build Site

```bash
bundle exec jekyll build
```

Output goes to `public/` directory.

### Check GitHub Actions Status

```bash
gh run list --limit 3
```

## Content Pages

- `index.html` - Home page with recent posts
- `now.markdown` - Now page (what I'm currently doing)
- `talks.markdown` - Conference talks and presentations
- `podcasts.markdown` - Podcast appearances
- `contact.markdown` - Contact information and social links

## Deployment

The site deploys automatically via GitHub Actions when pushing to `main`. The workflow:
1. Checks out code with full git history (for last_modified plugin)
2. Sets up Ruby 3.4
3. Installs dependencies with Bundler
4. Builds Jekyll site to `public/`
5. Deploys to GitHub Pages

## Notes

- Custom plugins require GitHub Actions deployment (not supported by default GitHub Pages)
- The `last_modified.rb` plugin reads git history to show when pages were last updated
- RSS feed at `/feed.xml` includes posts from `_posts/` only
- Site title: "Ernesto Tagwerker: Founder & CTO at OmbuLabs.ai"
