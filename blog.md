---
layout: default
title: "Hello!"
permalink: /blog/
---

{% for project in site.posts -%}
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
