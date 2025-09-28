---
layout: single
title: "Conferences"
permalink: /conferences/
author_profile: false
---

{% assign items = site.data.conferences | where_exp: "i", "i.end_year > 0" %}

{%- comment -%}
Ordina per anno (end_year desc, poi start_year desc) e costruisci
una stringa year_key = end_year (fallback a start_year)
{%- endcomment -%}
{% assign items = items | sort: "end_year" | reverse %}

{%- comment -%}
Mappa ruolo → badge class & label
{%- endcomment -%}
{% assign role_map = 
  "Speaker:speaker,Invited Speaker:speaker,Session Chair:chair,Workshop Chair:chair,Track Co-Chair:track,Program Co-Chair:program,Local Organizing Committee:loc,Organization:loc,Chair:chair" | split: "," %}

{%- capture role_label -%}Speaker|Invited Speaker|Session Chair|Workshop Chair|Track Co-Chair|Program Co-Chair|Local Organizing Committee|Chair|Organization{%- endcapture -%}
{% assign known_roles = role_label | split: "|" %}

{%- comment -%}
Helper per trovare la classe
{%- endcomment -%}
{% assign role_pairs = "" | split: "|" %}
{% for pair in role_map %}
  {% assign kv = pair | split: ":" %}
  {% assign role_pairs = role_pairs | push: kv %}
{% endfor %}

{%- assign current_year = "" -%}
<div class="conf-wrap">

{% for it in items %}
  {% assign year = it.end_year | default: it.start_year %}
  {% if year != current_year %}
    {% if current_year != "" %}</ul>{% endif %}
    <h2 class="conf-year">{{ year }}</h2>
    <ul class="conf-list">
    {% assign current_year = year %}
  {% endif %}

  {%- comment -%} Trova la classe badge per il ruolo {%- endcomment -%}
  {% assign role_class = "other" %}
  {% for kv in role_pairs %}
    {% assign k = kv[0] | strip %}
    {% assign v = kv[1] | strip %}
    {% if it.role == k %}
      {% assign role_class = v %}
      {% break %}
    {% endif %}
  {% endfor %}

  <li class="conf-item">
    <div class="conf-header">
      <span class="conf-badge conf-badge-{{ role_class }}">{{ it.role }}</span>
      {% if it.title %}
        {% if it.link and it.link != "" %}
          <strong class="conf-title"><a href="{{ it.link }}" target="_blank" rel="noopener">{{ it.title }}</a></strong>
        {% else %}
          <strong class="conf-title">{{ it.title }}</strong>
        {% endif %}
      {% endif %}
    </div>

    <div class="conf-meta">
      {% if it.period and it.period != "" %}
        <span class="conf-period">{{ it.period }}</span>
      {% endif %}
      {% if it.org and it.org != "" %}
        <span class="conf-sep">·</span> <span class="conf-org">{{ it.org }}</span>
      {% endif %}
    </div>

    {% if it.summary and it.summary != "" %}
      <div class="conf-summary">{{ it.summary }}</div>
    {% endif %}

    {% if it.tags and it.tags.size > 0 %}
      <div class="conf-tags">
        {% for tg in it.tags %}
          <span class="conf-tag">{{ tg }}</span>
        {% endfor %}
      </div>
    {% endif %}
  </li>
{% endfor %}

</ul>
</div>