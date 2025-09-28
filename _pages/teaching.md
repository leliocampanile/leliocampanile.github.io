---
layout: single
title: "Teaching"
permalink: /teaching/
author_profile: true
---

## Academic tutoring and teaching
<ul class="teach-list">
{% assign items = site.data.academic_teaching | sort: "start_year" | reverse %}
{% for t in items %}
  <li class="teach-item">
    <div class="teach-header">
      <span class="teach-period">[ {{ t.period }} ]</span>
      {% if t.link and t.link != "" %}
        <strong class="teach-title"><a href="{{ t.link | relative_url }}">{{ t.title }}</a></strong>
      {% else %}
        <strong class="teach-title">{{ t.title }}</strong>
      {% endif %}
    </div>
    <div class="teach-meta">
      {{ t.org }}{% if t.role %} — {{ t.role }}{% endif %}
    </div>
    {% if t.summary %}<p class="teach-summary">{{ t.summary }}</p>{% endif %}
    {% if t.tags %}
      <p class="teach-tags">
      {% for tag in t.tags %}
        <span class="teach-tag">{{ tag }}</span>
      {% endfor %}
      </p>
    {% endif %}
  </li>
{% endfor %}
</ul>

## Teaching and training positions
<ul class="teach-list">
{% assign items = site.data.teaching | sort: "start_year" | reverse %}
{% for t in items %}
  <li class="teach-item">
    <div class="teach-header">
      <span class="teach-period">[ {{ t.period }} ]</span>
      {% if t.link and t.link != "" %}
        <strong class="teach-title"><a href="{{ t.link | relative_url }}">{{ t.title }}</a></strong>
      {% else %}
        <strong class="teach-title">{{ t.title }}</strong>
      {% endif %}
    </div>
    <div class="teach-meta">
      {{ t.org }}{% if t.role %} — {{ t.role }}{% endif %}
    </div>
    {% if t.summary %}<p class="teach-summary">{{ t.summary }}</p>{% endif %}
    {% if t.tags %}
      <p class="teach-tags">
      {% for tag in t.tags %}
        <span class="teach-tag">{{ tag }}</span>
      {% endfor %}
      </p>
    {% endif %}
  </li>
{% endfor %}
</ul>