---
layout: single
title: "Conferences"
permalink: /conferences/
author_profile: false
---

{%- assign items_raw = site.data.conferences -%}
{%- comment -%} escludi record senza anno (opzionale) {%- endcomment -%}
{%- assign items = items_raw | where_exp: "i", "i.end_year > 0 or i.start_year > 0" -%}

{%- comment -%} ordina per anno decrescente (usa end_year fallback start_year) {%- endcomment -%}
{%- assign items = items | sort: "end_year" | reverse -%}

{%- comment -%} raccogli lista anni unici (desc) {%- endcomment -%}
{%- assign years = "" | split: "" -%}
{%- for it in items -%}
  {%- assign y = it.end_year | default: it.start_year -%}
  {%- unless years contains y -%}
    {%- assign years = years | push: y -%}
  {%- endunless -%}
{%- endfor -%}

{%- comment -%} mappa ruolo → classe badge {%- endcomment -%}
{%- assign role_pairs = "
Speaker:speaker,
Invited Speaker:speaker,
Session Chair:chair,
Workshop Chair:chair,
Track Co-Chair:track,
Program Co-Chair:program,
Local Organizing Committee:loc,
Chair:chair,
Organization:loc
" | strip | split: "," -%}

{%- assign role_map = "" | split: "|" -%}
{%- for pair in role_pairs -%}
  {%- assign kv = pair | strip | split: ":" -%}
  {%- if kv.size == 2 -%}
    {%- assign role_map = role_map | push: kv -%}
  {%- endif -%}
{%- endfor -%}

{%- comment -%} ===== Mini sommario per anno ===== {%- endcomment -%}
<nav class="conf-toc">
  <strong>Jump to year:</strong>
  <div class="conf-toc-years">
  {%- for y in years -%}
    <a href="#y{{ y }}">{{ y }}</a>
  {%- endfor -%}
  </div>
</nav>

<div class="conf-wrap">
{%- for y in years -%}
  <h2 id="y{{ y }}" class="conf-year">{{ y }}</h2>
  <ul class="conf-list">
  {%- assign year_items = items | where: "end_year", y -%}
  {%- if year_items.size == 0 -%}
    {%- assign year_items = items | where: "start_year", y -%}
  {%- endif -%}

  {%- for it in year_items -%}
    {%- assign role_class = "other" -%}
    {%- for kv in role_map -%}
      {%- assign k = kv[0] | strip -%}
      {%- assign v = kv[1] | strip -%}
      {%- if it.role == k -%}{%- assign role_class = v -%}{%- break -%}{%- endif -%}
    {%- endfor -%}

    <li class="conf-item conf-role-{{ role_class }}">
      <div class="conf-header">
        <span class="conf-badge conf-badge-{{ role_class }}">{{ it.role }}</span>
        {%- if it.title -%}
          {%- if it.link and it.link != "" -%}
            <strong class="conf-title"><a href="{{ it.link }}" target="_blank" rel="noopener">{{ it.title }}</a></strong>
          {%- else -%}
            <strong class="conf-title">{{ it.title }}</strong>
          {%- endif -%}
        {%- endif -%}
      </div>

      <div class="conf-meta">
        {%- if it.period and it.period != "" -%}
          <span class="conf-period">{{ it.period }}</span>
        {%- endif -%}
        {%- if it.org and it.org != "" -%}
          <span class="conf-sep">·</span> <span class="conf-org">{{ it.org }}</span>
        {%- endif -%}
      </div>

      {%- if it.summary and it.summary != "" -%}
        <div class="conf-summary">{{ it.summary }}</div>
      {%- endif -%}

      {%- if it.tags and it.tags.size > 0 -%}
        <div class="conf-tags">
          {%- for tg in it.tags -%}<span class="conf-tag">{{ tg }}</span>{%- endfor -%}
        </div>
      {%- endif -%}
    </li>
  {%- endfor -%}
  </ul>
{%- endfor -%}
</div>