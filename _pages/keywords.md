---
layout: single
title: "Publications by Keyword"
permalink: /keyword/:keyword/
---

# Publications tagged with "{{ page.keyword }}"

{% bibliography --query @*[keywords~={{ page.keyword }}] %}

<p><a href="{{ '/publications/' | relative_url }}">← Back to all publications</a></p>