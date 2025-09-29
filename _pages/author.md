---
layout: single
title: "Publications by {{ page.author }}"
permalink: /author/:name/
author_profile: true
toc: false
---

# Publications by “{{ page.author }}”

{% bibliography --query @*[author~={{ page.author | replace: '"','\"' }}] --template bibliography_item --details %}

<p><a href="{{ '/publications/' | relative_url }}">← Back to all publications</a></p>