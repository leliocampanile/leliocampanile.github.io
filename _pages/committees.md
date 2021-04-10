---
layout: archive
title: "Committees"
permalink: /committees/
author_profile: true
---



{% for committee in site.data.committees %}

- [ {{ committee.year }} ] {{ committee.acronyms }}, {{ committee.title }} - {{ committee.role }}

{% endfor %}