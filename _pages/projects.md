---
layout: single
title: "Projects"
permalink: /projects/
author_profile: true
---

## Research related projects
<ul class="project-list">
{% assign items = site.data.research_projects | sort: "start_year" | reverse %}
{% for p in items %}
  <li class="project-item">
    <div class="project-header">
      <span class="project-period">[ {{ p.period }} ]</span>
      <strong class="project-title">{{ p.title }}</strong>
    </div>
    <div class="project-meta">
      {% if p.org %}{{ p.org }}{% endif %}{% if p.program %} — <em>{{ p.program }}</em>{% endif %}{% if p.partner %} — Partner: {{ p.partner }}{% endif %}{% if p.role %} — {{ p.role }}{% endif %}
    </div>
    {% if p.summary %}<p class="project-summary">{{ p.summary }}</p>{% endif %}
    {% if p.tags %}
      <p class="project-tags">
      {% for t in p.tags %}
        <span class="project-tag">{{ t }}</span>
      {% endfor %}
      </p>
    {% endif %}
    {% if p.links %}
      <p class="project-links">
      {% for l in p.links %}
        <a href="{{ l.url }}" target="_blank" rel="noopener">{{ l.label }}</a>{% unless forloop.last %} · {% endunless %}
      {% endfor %}
      </p>
    {% endif %}
  </li>
{% endfor %}
</ul>

## Professional related projects
<ul class="project-list">
{% assign items = site.data.professional_projects | sort: "start_year" | reverse %}
{% for p in items %}
  <li class="project-item">
    <div class="project-header">
      <span class="project-period">[ {{ p.period }} ]</span>
      <strong class="project-title">{{ p.title }}</strong>
    </div>
    <div class="project-meta">
      {% if p.org %}{{ p.org }}{% endif %}{% if p.role %} — {{ p.role }}{% endif %}
    </div>
    {% if p.summary %}<p class="project-summary">{{ p.summary }}</p>{% endif %}
    {% if p.tags %}
      <p class="project-tags">
      {% for t in p.tags %}
        <span class="project-tag">{{ t }}</span>
      {% endfor %}
      </p>
    {% endif %}
  </li>
{% endfor %}
</ul>

