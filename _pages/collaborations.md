---
layout: single
title: "Collaborations"
permalink: /collaborations/
author_profile: true
---

{%- assign items_raw = site.data.collaborations | default: nil -%}

{%- if items_raw == nil -%}
<div class="notice--warning">
  <p><strong>No collaboration data found.</strong> Create <code>_data/collaborations.json</code>.</p>
</div>
{%- else -%}

{%- comment -%} Split Ongoing vs Past {%- endcomment -%}
{%- assign ongoing = items_raw | where_exp: "i", "i.end_year == 0 or i.end_year == nil" -%}
{%- assign past = items_raw | where_exp: "i", "i.end_year and i.end_year > 0" -%}

{%- assign past = past | sort: "end_year" | reverse -%}

{%- assign role_pairs = "
Research Collaboration:collab,
EU Project Collaboration:eu,
Working Group Member:wgm,
Local Collaboration:local
" | strip | split: "," -%}
{%- assign role_map = "" | split: "|" -%}
{%- for pair in role_pairs -%}
  {%- assign kv = pair | strip | split: ":" -%}
  {%- if kv.size == 2 -%}{%- assign role_map = role_map | push: kv -%}{%- endif -%}
{%- endfor -%}

<h2 id="ongoing" class="coll-h2">Ongoing</h2>
<ul class="coll-list">
{% for it in ongoing %}
  {% assign role_class = "other" %}
  {% for kv in role_map %}
    {% assign k = kv[0] | strip %}
    {% assign v = kv[1] | strip %}
    {% if it.role == k %}{% assign role_class = v %}{% break %}{% endif %}
  {% endfor %}
  <li class="coll-item coll-role-{{ role_class }}">
    <div class="coll-header">
      <span class="coll-badge coll-badge-{{ role_class }}">{{ it.role }}</span>
      {% if it.title %}<strong class="coll-title">{{ it.title }}</strong>{% endif %}
    </div>
    <div class="coll-meta">
      {% if it.period %}<span class="coll-period">{{ it.period }}</span>{% endif %}
      {% if it.org %}<span class="coll-sep">·</span><span class="coll-org">{{ it.org }}</span>{% endif %}
      {% if it.people and it.people.size > 0 %}<span class="coll-sep">·</span><span class="coll-people">{{ it.people | join: ", " }}</span>{% endif %}
    </div>
    {% if it.summary %}<div class="coll-summary">{{ it.summary }}</div>{% endif %}
    {% if it.outputs and it.outputs.size > 0 %}
      <div class="coll-outputs">
        <em>Outputs:</em>
        <ul class="coll-outputs-list">
          {% for o in it.outputs %}<li>{{ o }}</li>{% endfor %}
        </ul>
      </div>
    {% endif %}
    {% if it.tags and it.tags.size > 0 %}
      <div class="coll-tags">{% for tg in it.tags %}<span class="conf-tag">{{ tg }}</span>{% endfor %}</div>
    {% endif %}
  </li>
{% endfor %}
</ul>

<h2 id="past" class="coll-h2">Past</h2>
<ul class="coll-list">
{% for it in past %}
  {% assign role_class = "other" %}
  {% for kv in role_map %}
    {% assign k = kv[0] | strip %}
    {% assign v = kv[1] | strip %}
    {% if it.role == k %}{% assign role_class = v %}{% break %}{% endif %}
  {% endfor %}
  <li class="coll-item coll-role-{{ role_class }}">
    <div class="coll-header">
      <span class="coll-badge coll-badge-{{ role_class }}">{{ it.role }}</span>
      {% if it.title %}<strong class="coll-title">{{ it.title }}</strong>{% endif %}
    </div>
    <div class="coll-meta">
      {% if it.period %}<span class="coll-period">{{ it.period }}</span>{% endif %}
      {% if it.org %}<span class="coll-sep">·</span><span class="coll-org">{{ it.org }}</span>{% endif %}
      {% if it.people and it.people.size > 0 %}<span class="coll-sep">·</span><span class="coll-people">{{ it.people | join: ", " }}</span>{% endif %}
    </div>
    {% if it.summary %}<div class="coll-summary">{{ it.summary }}</div>{% endif %}
    {% if it.outputs and it.outputs.size > 0 %}
      <div class="coll-outputs">
        <em>Outputs:</em>
        <ul class="coll-outputs-list">
          {% for o in it.outputs %}<li>{{ o }}</li>{% endfor %}
        </ul>
      </div>
    {% endif %}
    {% if it.tags and it.tags.size > 0 %}
      <div class="coll-tags">{% for tg in it.tags %}<span class="conf-tag">{{ tg }}</span>{% endfor %}</div>
    {% endif %}
  </li>
{% endfor %}
</ul>

{%- endif -%}