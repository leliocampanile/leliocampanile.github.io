---
layout: archive
title: "CV"
permalink: /cv/
author_profile: true
redirect_from:
  - /resume
---

{% include base_path %}

### [Download full cv updated to 2021-11-16]({{ site.url }}/files/2020-11-16-full-cv.pdf)

Work experience
======
* [ 2007 – Current ] Full time employee at University - Università degli Studi della Campania “Luigi Vanvitelli” -  Caserta Italy : IT technical employee
  * Computer Network design and PBX administration
  * Programming
  * System administrator
  * Technical support for research activities

* [ 2015 – 2019 ] Teacher in iOS Foundation Courses - Università degli Studi della Campania “Luigi Vanvitelli” in collaboration with Apple

* [ 2005 – Current ] Teacher/Instructor in many IT courses: web design, web programming, database design, iOS developing

* [ 2004 – 2007 ] Independent Professional activity as ICT consultant

Engineering Licence
======

* [ 2007 ] Passed the government exam and licensed as a profession engineer section B - Informatics, and enrolled as a member of the Italian Engineering Society with n. 48

* [ 2019 ] Passed the government exam and licensed as a profession engineer section A - Informatics (Computer Science), and enrolled as a member of the Italian Engineering Society with n. 4959

Education
======
* [ 2018 - Current] Ph.D. Student - Università degli Studi della Campania “L. Vanvitelli - Dipartimento di Matematica e Fisica” 
* [ 2015 ] Laurea Magistrale in Ingegneria Informatica (MSc in Computer Engineering) - Università degli Studi Guglielmo Marconi   - Rome
* [ 2004 ] Laurea Ingegneria Informatica (BSc in Computer Engineering) - Seconda Università degli Studi di Napoli - Aversa (CE) (Italy)
* [ 2004 ] Traineeship on real time rendering using cluster computer - Istituto per il calcolo e le Reti ad Alte Prestazioni del Consiglio Nazionale delle ricerche  
* [ 1998 ] Maturità Scientifica (Scientific High School Degree) Liceo “A. Giordano” Venafro Italy - Liceo “A. Giordano”  Venafro(IS) (Italy)
  
Projects
======

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


Publications
======
  <ul>{% for post in site.publications %}
    {% include archive-single-cv.html %}
  {% endfor %}</ul>
  

# Academic Tutoring And Teaching 

{% for post in site.teaching  %}
  {% if post.type == 'Academic Teaching' %}
    {% include archive-single-cv.html %}
  {% endif %}
{% endfor %}

# Teaching Training Position 

{% for post in site.teaching  %}
{% if post.type == 'Professional Training Course' %}
  {% include archive-single-cv.html %}
{% endif %}
{% endfor %}

