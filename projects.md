---
layout: default
title: ""
permalink: /projects/
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
