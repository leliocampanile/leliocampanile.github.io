---
layout: single
title: "DEBUG: author filters"
permalink: /debug/author-filter/
author_profile: false
toc: false
---


# Test 3: Con autore (sostituisci COGNOME)
{% bibliography   --group_by year --group_order descending --template bibliography_item  --query  @*[author~=Lotito] %}

# Test 4: Count
Totale voci: {% bibliography_count %}
Con filtro: {% bibliography_count --query @*[author~=Lotito] %}

