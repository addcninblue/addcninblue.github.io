---
layout: page
title: "Current Projects"
permalink: /projects/
---

These are some projects I've either been involved with or primarily developed. If anything looks interesting, contact me to help codevelop it!

---

{% for project in site.projects -%}
# {{ project.title }}
{{ project.excerpt }}

{%- if project.external-url -%}
[Read On &rarr;]({{ project.external-url }})
{%- else -%}
[Read On &rarr;]({{ project.url }})
{% endif %}

{% if forloop.last == false %}

<br>

---

<br>

{% endif %}
{% endfor %}
