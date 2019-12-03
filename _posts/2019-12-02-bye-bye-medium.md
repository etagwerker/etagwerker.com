---
layout: post
title: Bye bye, Medium! Hello, Jekyll 4.0! 👋🏼
date: 2019-12-02 21:25 -0500
---

This year Medium decided to [implement a paywall](https://techcrunch.com/2019/02/27/medium-twitter-paywall/)
with all their content (meaning my content, and your content, and anyone's content
published in their platform)

When that happened I thought it was a good idea to leave their platform and use
[Jekyll](https://jekyllrb.com/) instead. It took me almost 10 months to finally
move away from Medium! This Thanksgiving break was a good time to spend a few
hours migrating my content to Jekyll + [GitHub Pages](https://pages.github.com/).

Here is how I did it:

<!--more-->

1. I started with [FastRuby.io](https://fastruby.io)'s blog's source code (which is
[open source](https://github.com/fastruby/blog)). Then I followed the instructions
in this article: [https://hackernoon.com/medium-2-md-convert-medium-posts-to-markdown-with-front-matter-c044e02c3cbb](https://hackernoon.com/medium-2-md-convert-medium-posts-to-markdown-with-front-matter-c044e02c3cbb)

2. I tweaked some of the content and file names. I had to massively edit file
names so that Jekyll could figure out that it had to generate HTML pages for
them.

3. I migrated from Jekyll 3.0 to 4.0. Fortunately the migration was quite easy!
You can see all the changes over here: [https://github.com/etagwerker/etagwerker.com/pull/1/files](https://github.com/etagwerker/etagwerker.com/pull/1/files)

4. I implemented [Hyde](https://github.com/poole/hyde) and tweaked a few details
to find a look & feel that I liked.

5. I configured [Route 53](https://aws.amazon.com/route53/) and [GitHub](https://github.com)
to [serve the domain without `www`](https://help.github.com/en/github/working-with-github-pages/about-custom-domains-and-github-pages#using-an-apex-domain-for-your-github-pages-site). The nice thing
about GitHub Pages is that it is simple, easy, and free for open source projects.

<p class="centered">
<img src="/assets/images/github-pages-configuration-dns.png" alt="GitHub's Pages DNS Settings">
</p>

Here is the end result!

<p class="centered">
<img src="/assets/images/jekyll-end-result.png" alt="Screenshot of etagwerker.com using Jekyll + Hyde (Poole)" class="">
</p>

If you are thinking about migrating away from Medium, Jekyll is a great
alternative to have full control of your platform and content! ❤️
