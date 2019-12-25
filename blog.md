---
layout: default
title: "Hello!"
permalink: /blog/
---

{% for post in site.posts -%}

<header class="post-header">
{: .post-title}
# {{ post.title }}

{: .post-meta }
{{ post.date | date: "%b %-d, %Y" }}
</header>

{{ post.excerpt }}

{%- if post.external-url -%}
[Read On &rarr;]({{ post.external-url }})
{%- else -%}
[Read On &rarr;]({{ post.url }})
{% endif %}

{% if forloop.last == false %}

<br>

---

<br>

{% endif %}
{% endfor %}
