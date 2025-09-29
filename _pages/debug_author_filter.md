---
layout: single
title: "DEBUG: author filters"
permalink: /debug/author-filter/
author_profile: false
toc: false
---

## Test 1 — regex semplice (cognome con particella)

**Query:** `@*[author=/Di Bonito/]`

{% bibliography --group_by year --group_order descending --template bibliography_item --details --query @*[author=/Di Bonito/] %}

---

## Test 2 — regex semplice (cognome “Balzanella”)

**Query:** `@*[author=/Balzanella/]`

{% bibliography --group_by year --group_order descending --template bibliography_item --details --query @*[author=/Balzanella/] %}

---

## Test 3 — tilde (contains) SENZA virgolette

**Query:** `@*[author~=Di Bonito]`

{% bibliography --group_by year --group_order descending --template bibliography_item --details --query @*[author~=Di Bonito] %}

---

## Test 4 — tilde (contains) per Balzanella

**Query:** `@*[author~=Balzanella]`

{% bibliography --group_by year --group_order descending --template bibliography_item --details --query @*[author~=Balzanella] %}