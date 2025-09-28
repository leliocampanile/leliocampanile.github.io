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


## Reasearch related projects

* [ 2020 ] Università degli Studi della Campania "L. Vanvitelli" - Programma V:ALERE 2020 - __WAIILD TROLS:__ Web Artificial Intelligence for Information Literacy Dissemination – TRuth Or Lies Sources?

## Professional related projects

* [ 2010 – 2011 ] SUN High Speed Networks
Member of the "SUN High Speed Network" project team. The project provided fiber optic connection among the " Università della Campania Luigi Vanvitelli" (former "Seconda Università degli Studi di Napoli") sites, distributed on the regional territory.

* [ 2008 – 2009 ] WIFI SUN
Member of the "WIFI SUN" project team. The project provided a wifi network for the students, deployed over 10 sites of the "Università della Campania Luigi Vanvitelli" (former "Seconda Università degli Studi di Napoli")
   
* [ 2013 – 2015 ] RIMIC
Member of the working team of "RIMIC" (Rete di Interconnessione Multiservizio Interuniversitaria Campana): it pr ovides a wide range of networking services, available on the entire regional territory, can be used as support to research projects and training for all the university of Campania Region. The network is based on fiber optical interconnections and enable the use of the wavelength division multiplexed technology.

* [ 2013 ] University Datacenter
Member of the project team for the design of the new university datacenter ( "Università della Campania Luigi
Vanvitelli") in Caserta's site 

* [ 2013 ] University Website 
Member of the working group for the design of the new university website ( "Università della Campania Luigi Vanvitelli")