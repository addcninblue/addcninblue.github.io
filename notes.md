---
layout: page
title: "Notes"
permalink: /notes/
toc: true
---

Hello! Welcome to my general set of notes. They aren't guaranteed to be particularly correct or complete, but do send an [email](mailto:addcninblue@berkeley.edu?subject=Notes Issue) my way if something is wrong!

{% if site.cs61a %}
## CS 61A [sp20 // TA]
{% for note in site.cs61a -%}
- [{{ note.title }}]({{ note.url }})
{% endfor %}
{% endif %}

{% if site.cs189 %}
## CS 189 [sp20]
{% for note in site.cs189 -%}
- [{{ note.title }}]({{ note.url }})
{% endfor %}
{% endif %}

{% if site.cs161 %}
## CS 161 [sp20]
{% for note in site.cs161 -%}
- [{{ note.title }}]({{ note.url }})
{% endfor %}
{% endif %}

{% if site.stat155 %}
## Stat 155 [sp20]
{% for note in site.stat155 -%}
- [{{ note.title }}]({{ note.url }})
{% endfor %}
{% endif %}

{% if site.math104 %}
## Math 104 [sp20]
{% for note in site.math104 -%}
- [{{ note.title }}]({{ note.url }})
{% endfor %}
{% endif %}

{% if site.ee375 %}
## EE 375 [sp20]
{% for note in site.ee375 -%}
- [{{ note.title }}]({{ note.url }})
{% endfor %}
{% endif %}
