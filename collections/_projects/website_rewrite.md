---
layout: page
title: "Website Rewrite"
priority: 4
---

## Background
My old website was written in pure HTML and CSS back in high school, and the content was extremely outdated. Maintaining the website was a hassle and a nightmare, since there was a lack of cohesion in the code -- it was very much glued together. I needed to be able to generate content for teaching quickly, and I knew the current solution I had then would not scale. As a result, I started to look for a solution involving something I knew well -- Markdown.

## Jekyll + Whiteglass
I stumbled upon [CS151's website](http://inst.eecs.berkeley.edu/~eecs151/sp18/), which uses this same theme. Seeing that they converted a blog posting engine (Jekyll) into something more of a personal website generator from Markdown, I decided it was time to dive in and explore how it worked.

The setup of Jekyll + Whiteglass is extremely easy. Their instructions are straightforward and cohesive, and setup was quick. Converting the websites to a personal website took only a bit of time once I figured out the right pages to modify, and most of the pages I wrote are written in Markdown. Adding new pages is also extremely quick, and the syntax highlighting is beautiful, making it easy to generate new content.

## Deployment
This website is served from a Google Cloud Engine instance with the `f1-micro` (free) plan, deployed using Dokku as a static website (behind Nginx).

[Github](https://github.com/addcninblue/addcninblue.github.io)
