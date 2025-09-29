---
layout: single
title: "Journal Articles"
permalink: /publications/journal/
author_profile: true
toc: false
---

{% comment %} 
Casi coperti:
- Tipologia BibTeX: @article
- Campo personalizzato type contenente "Article" (se presente)
{% endcomment %}

{% bibliography --query @*[type~=Article] --template bibliography_item --details %}