---
layout: single
title: "Publications by {{ page.author }}"
permalink: /author/:name/
author_profile: true
toc: false
---


{% bibliography --query @*[author~="#{name}"] --template bibliography_item --details %}
<p><a href="{{ '/publications/' | relative_url }}">← Back to all publications</a></p>