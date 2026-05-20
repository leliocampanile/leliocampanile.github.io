---
title: "Databases and Information Systems"
permalink: /teaching/dbis/
layout: single
author_profile: true
toc: true
toc_label: "On this page"
toc_icon: "graduation-cap"
toc_sticky: true
---

## Course Overview

**Databases and Information Systems (DBIS)** is a 6 CFU course offered within the Bachelor's Degree in Data Analytics at Università degli Studi della Campania *Luigi Vanvitelli*, A.Y. 2025/2026.

The course is composed of two modules:

| Part | CFU | Instructor |
|--------|-----|------------|
| **Part 1** — Introduction, E-R and Relational Foundations | 3 | Prof. Ing. Mauro Iacono, PhD |
| **Part 2** — From Design to Implementation (SQL, NoSQL) | 3 | Prof. Ing. Lelio Campanile, PhD |

The course is taught in 12 teaching weeks plus the Easter break (56 academic hours total). The natural learning sequence is:

> **Introduction → E-R model → Relational model → ER-to-relational translation → SQL → NoSQL** — with hands-on exercises and worked examples interleaved.

## Textbook

| Book | Role |
|------|------|
| **P. Atzeni, S. Ceri, S. Paraboschi, R. Torlone, *Database Systems: Concepts, Languages and Architectures*, McGraw-Hill** | Main textbook — freely available at [dbbook.inf.uniroma3.it](https://dbbook.inf.uniroma3.it) |

The companion English slide decks (`BD…eng`) used in Module 1 are also distributed from the same website. The textbook is the canonical reference for the entire course. NoSQL is treated only in the lectures.

## Course Structure

### Part I — Introduction, E-R and Relational Foundations (Prof. Iacono)

| # | Topic | Atzeni et al. | Slides |
|---|-------|---------------|--------|
| 01 | Introduction to Information Systems and DBMS | Ch. 1 | [PDF](/files/dbis/01_introduction_theory.pdf) |
| 02 | Database Design Techniques and Models | Ch. 5 | [PDF](/files/dbis/02_design_methodology_theory.pdf) |
| 03 | Conceptual Design — The E-R Model | Ch. 6 | [PDF](/files/dbis/03_conceptual_design_er_theory.pdf) |
| 08 | The Relational Model | Ch. 2 | [PDF](/files/dbis/08_relational_model_theory.pdf) |
| 09 | Logical Design — Overview | Ch. 7 | [PDF](/files/dbis/09_logical_design_overview_theory.pdf) |

### Part II — From Design to Implementation (Prof. Campanile)

#### E-R Restructuring and Translation to the Relational Model

| # | Topic | Atzeni et al. | Slides |
|---|-------|---------------|--------|
| 10 | E-R Restructuring | Ch. 7 (restructuring phase) | [PDF](/files/dbis/10_er_restructuring_theory.pdf) |
| 11 | Logical Translation (E-R → Relational) | Ch. 7 (translation phase) | [PDF](/files/dbis/11_logical_translation_theory.pdf) |

#### SQL — From Schema to Advanced Queries

| # | Topic | Atzeni et al. | Slides |
|---|-------|---------------|--------|
| 12 | SQLite Setup and Tools | — (lab) | [PDF](/files/dbis/12_sqlite_setup_exercise.pdf) |
| 13 | E-R Recap on Lab Schemas | — (lab) | [PDF](/files/dbis/13_er_recap_exercise.pdf) |
| 14 | From E-R to SQL Schema | Ch. 4 | [PDF](/files/dbis/14_from_er_to_sql_schema_exercise.pdf) |
| 15 | SQL — DDL and DML Introduction | Ch. 4 | [PDF](/files/dbis/15_sql_ddl_dml_intro_theory.pdf) |
| 18 | SQL JOIN — Theory | Ch. 4 | [PDF](/files/dbis/18_join_theory.pdf) |
| 19 | Advanced SQL — JOIN and UNION | Ch. 4 | [PDF](/files/dbis/19_sql_advanced_join_union_theory.pdf) |
| 20 | Advanced SQL — Subqueries and Views | Ch. 4 | [PDF](/files/dbis/20_sql_advanced_subqueries_views_theory.pdf) |

### Part III — NoSQL (Prof. Campanile)

| # | Topic | Reference | Slides |
|---|-------|-----------|--------|
| 21 | NoSQL Databases — Models, Trade-offs, Polyglot Persistence | Lecture material | [PDF](/files/dbis/21_nosql_theory.pdf) |

## Worked Examples and In-Class Exercises

### Worked E-R Design Examples (used during Part I)

Four worked examples by Prof. Campanile, each starting from a textual description of a domain and constructing the E-R diagram step by step. Used during the Conceptual Design lectures.

| # | Domain | After lecture | Slides |
|---|--------|---------------|--------|
| 04 | University (students, courses, exams) — simplest example | 03 | [PDF](/files/dbis/04_er_design_university_example.pdf) |
| 05 | Library (users, books, loans) — running example for Module 2 | 03 | [PDF](/files/dbis/05_er_design_library_example.pdf) |
| 06 | E-commerce platform (products, carts, orders, payments) | 03 | [PDF](/files/dbis/06_er_design_ecommerce_example.pdf) |
| 07 | Streaming platform (catalog, subscriptions, viewing history) | 03 | [PDF](/files/dbis/07_er_design_streaming_example.pdf) |

### SQL Lab Exercises (used during Part II)

Guided lab sessions with tasks and reference solutions on the **Library** and **Swimming Pool** schemas.

| Exercise | After lecture | Topic | Slides |
|----------|---------------|-------|--------|
| Basic SQL on the Library schema | 15 | INSERT, UPDATE, DELETE, SELECT, aggregates, GROUP BY ... HAVING | [PDF](/files/dbis/16_sql_basic_library_exercise.pdf) |
| Basic SQL on the Swimming Pool schema | 15 | Same skills on a different schema | [PDF](/files/dbis/17_sql_basic_pool_exercise.pdf) |

## Study Guide

A detailed study guide with chapter-by-chapter reading advice, focus areas for each lecture, and practical tips is available here:

**[Study Guide for Students](/teaching/dbis/study-guide/)**
{: .notice--info}

## Exam Format

The final exam combines a written and an oral component, and offers two paths.

**Attending students (path A)**
: Two **midterm exams** (*prove intercorso*) — the first in Week 8 covers Module 1 (E-R model, logical design, normalization), the second in Week 12 covers Module 2 (SQL and the relational model). Both midterms are practical, in-class tests. An **oral exam** then completes the assessment.

**Non-attending students (path B)**
: A single 3-hour **written exam** covering all course topics — Database Design (E-R, logical design, normalization) and SQL with the Relational Model (algebra, queries, data definition and manipulation) — followed by the oral exam.

**Oral exam — always mandatory.**
: The oral covers the entire syllabus for all students, including the topics of both modules. The final grade combines the written component and the oral.

## Contact

For questions, contact Prof. Lelio Campanile at [lelio.campanile@unicampania.it](mailto:lelio.campanile@unicampania.it).
or  contact Prof. Mauro Iacono at [mauro.iacono@unicampania.it](mailto:mauro.iacono@unicampania.it).

---

<small>
**Copyright Notice.**
The lecture slides for this course have been prepared by Prof. Mauro Iacono and Prof. Lelio Campanile and contain material adapted from the following source:

- Slides accompanying *Database Systems: Concepts, Languages and Architectures* by Paolo Atzeni, Stefano Ceri, Stefano Paraboschi and Riccardo Torlone. Copyright &copy; the authors and McGraw-Hill. Used and adapted for educational purposes. The book and its companion materials are freely distributed at [dbbook.inf.uniroma3.it](https://dbbook.inf.uniroma3.it).

All original material in the slides is &copy; the respective authors. The lecture materials are provided for personal study by enrolled students. Redistribution or commercial use is not permitted without explicit authorization from the respective copyright holders.
</small>
