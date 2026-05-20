---
title: "DBIS — Study Guide for Students"
permalink: /teaching/dbis/study-guide/
layout: single
author_profile: true
toc: true
toc_label: "Lectures"
toc_icon: "book-open"
toc_sticky: true
---

**[Back to Course Page](/teaching/dbis/)**

> This guide covers the full **Databases and Information Systems** course (6 CFU), composed of two parts: **Introduction, E-R and Relational Foundations** (3 CFU, Prof. Mauro Iacono) and **From Design to Implementation: SQL and NoSQL** (3 CFU, Prof. Lelio Campanile).

## How to Use This Guide

The course follows the natural learning sequence: **introduction → E-R model → relational model → ER-to-relational translation → SQL → NoSQL**, with hands-on exercises and worked examples interleaved. This is not the order in which topics appear in the textbook (Ch. 2 *Relational Model* comes before Ch. 5–7 *Design*), but it is the most intuitive learning path: E-R is introduced first because it is closer to how students naturally think about a domain, and the relational model is introduced later as the target into which the E-R schema will be translated.

For each lecture you will find the chapters to study in the textbook, the topics covered, and advice on where to focus your attention. Worked examples and lab exercises are indicated at the point in the syllabus where they take place.

## Textbook

| Book | Role |
|------|------|
| **P. Atzeni, S. Ceri, S. Paraboschi, R. Torlone, *Database Systems: Concepts, Languages and Architectures*, McGraw-Hill** | Main textbook — freely available at [dbbook.inf.uniroma3.it](https://dbbook.inf.uniroma3.it), together with the official slide decks (`BD…eng`) used in Module 1 |

The book is the canonical reference for every topic in the course except NoSQL (which is treated only in the lectures). Whenever a topic feels too compressed in the slides, you have to **open the book** — it is freely available, well written, and the exam is based on it.

---

## Introduction, E-R and Relational Foundations (Prof. Iacono)

### Lecture 1 — Introduction to Information Systems and DBMS

| | |
|---|---|
| **Slides** | [01_introduction_theory.pdf](/files/dbis/01_introduction_theory.pdf) |
| **Atzeni et al.** | Chapter 1 |

The starting point of the course. What an information system is, what a database is, the role of a DBMS, the abstraction levels (external / logical / internal schema), data independence, and the actors around a database (DBA, designers, application developers, end users). The distinction between *data* and *information* is established, and the lecture argues why a DBMS is preferable to a flat-file approach when several applications share the same data.

**Key focus areas:** the basic definitions (what a database is, what a DBMS is), the three-level architecture and the two forms of data independence (logical and physical), the difference between a schema and an instance, the roles of the actors that interact with a database.

---

### Lecture 2 — Database Design Methodology

| | |
|---|---|
| **Slides** | [02_design_methodology_theory.pdf](/files/dbis/02_design_methodology_theory.pdf) |
| **Atzeni et al.** | Chapter 5 |

The big picture of database design before diving into each phase. A database is designed in three phases: **conceptual design** (producing an E-R diagram from requirements), **logical design** (translating the E-R diagram into a relational schema), and **physical design** (storage, indexes, tuning). The lecture also covers the role of requirements gathering and the iterative nature of the process.

**Key focus areas:** being able to describe the three phases of design and what is produced at each step, understanding why conceptual design is independent from any specific DBMS, knowing the typical inputs and outputs of each phase.

---

### Lecture 3 — Conceptual Design with the E-R Model

| | |
|---|---|
| **Slides** | [03_conceptual_design_er_theory.pdf](/files/dbis/03_conceptual_design_er_theory.pdf) |
| **Atzeni et al.** | Chapter 6 |

The Entity-Relationship model in full: entities, attributes (simple, composite, multi-valued, derived), relationships, cardinalities (1:1, 1:N, N:M with minimum and maximum cardinality), identifiers (internal, external, composite), generalisations (IS-A hierarchies, total/partial, exclusive/overlapping), and the methodology to read a textual specification and produce an E-R diagram.

**Key focus areas:** being able to identify entities and relationships from a textual description, choosing identifiers correctly, applying cardinalities with both min and max (e.g. `(0,N)` vs `(1,N)`), modelling generalisations only when they bring real value to the schema.

> **Worked examples — E-R Design from Requirements:** four examples by Prof. Campanile are used immediately after this lecture as a bridge between theory and practice. Each starts from a textual description of a domain and walks step by step to the final E-R diagram.
>
> - **University** ([04_er_design_university_example.pdf](/files/dbis/04_er_design_university_example.pdf)) — the simplest one. Students, courses, exams.
> - **Library** ([05_er_design_library_example.pdf](/files/dbis/05_er_design_library_example.pdf)) — users, books, loans. This is the **running example** that returns throughout Module 2, so it is the most important one to internalise.
> - **E-commerce** ([06_er_design_ecommerce_example.pdf](/files/dbis/06_er_design_ecommerce_example.pdf)) — products, carts, orders, payments. Focus on the relationship between order items and products.
> - **Streaming** ([07_er_design_streaming_example.pdf](/files/dbis/07_er_design_streaming_example.pdf)) — catalog, subscriptions, viewing history. The most articulated example, with ternary relationships and historical data.
>
> Read each example twice: the first time, cover the solution and try to design the E-R yourself; the second time, compare it with the proposed solution and write down what you missed.

---

### Lecture 4 — The Relational Model

| | |
|---|---|
| **Slides** | [08_relational_model_theory.pdf](/files/dbis/08_relational_model_theory.pdf) |
| **Atzeni et al.** | Chapter 2 |

After the conceptual design has been completed in E-R, the relational model is introduced as the **target** of logical design. The lecture covers the foundational concepts: relations and tables, attributes and domains, tuples, schemas vs. instances, keys (super-key, candidate key, primary key), `NULL` values, and integrity constraints — both intra-relation (domain constraints, `NOT NULL`, `UNIQUE`) and inter-relation (referential integrity via foreign keys).

**Key focus areas:** mastering the terminology (relation, attribute, tuple, domain, schema, instance), understanding what a key is and the difference between super-key, candidate, and primary key, knowing how foreign keys enforce referential integrity, understanding why `NULL` is more subtle than "no value".

---

### Lecture 5 — Logical Design (Overview)

| | |
|---|---|
| **Slides** | [09_logical_design_overview_theory.pdf](/files/dbis/09_logical_design_overview_theory.pdf) |
| **Atzeni et al.** | Chapter 7 |

The textbook treatment of logical design. The phase is split in two: **restructuring** the E-R schema to make it suitable for translation, and **translation** of the restructured schema into the relational model. This overview lecture covers both steps from the textbook's perspective; Prof. Campanile's lectures (Module 2) then revisit each phase in detail with additional examples.

**Key focus areas:** understanding why logical design is split into restructuring and translation, knowing the cost analysis based on operation frequency that drives some restructuring decisions, recognising the standard translation patterns (entities → relations, relationships → foreign keys for 1:N or junction tables for N:M).

---

## From Design to Implementation (Prof. Campanile)

### Lecture 6 — E-R Restructuring

| | |
|---|---|
| **Slides** | [10_er_restructuring_theory.pdf](/files/dbis/10_er_restructuring_theory.pdf) |
| **Atzeni et al.** | Chapter 7 (restructuring phase) |

The restructuring phase in detail, with worked examples on each transformation: **eliminating generalisations** (three strategies: collapsing upward, collapsing downward, replacing with relationships), **partitioning or merging entities** based on access patterns, **dealing with multi-valued and composite attributes**, **choosing the primary key** among candidate keys (size, simplicity, stability), and **resolving weak entities**. This is the step that students most often underestimate at the exam.

**Key focus areas:** for every transformation, understanding *why* it is applied (not just the mechanics), being able to compare the three generalisation-elimination strategies and choose the most appropriate one for a given scenario, being able to justify primary key choices, recognising when an entity should be partitioned for performance reasons.

---

### Lecture 7 — Logical Translation (E-R → Relational)

| | |
|---|---|
| **Slides** | [11_logical_translation_theory.pdf](/files/dbis/11_logical_translation_theory.pdf) |
| **Atzeni et al.** | Chapter 7 (translation phase) |

The translation phase, worked through on multiple schemas. The basic rules: each entity becomes a relation; each 1:N relationship becomes a foreign key on the "many" side; each N:M relationship becomes a junction table; cardinalities translate into `NOT NULL` and `UNIQUE` constraints; identifiers become primary keys. Edge cases: 1:1 relationships, recursive relationships, ternary relationships, relationships with attributes.

**Key focus areas:** being able to translate any restructured E-R schema into a relational schema without hesitation, knowing how cardinalities map to `NOT NULL`/`UNIQUE`, correctly handling N:M relationships with their own attributes, recognising that 1:1 relationships have two possible translations and choosing between them based on participation.

> **Self-check after Lectures 6 and 7:** pick any of the four worked E-R examples (University, Library, E-commerce, Streaming), restructure it and produce the relational schema **without looking at the solution**. The set of tables, primary keys and foreign keys you produce should match the one shown in the slides.

---

### Lecture 8 — SQLite Setup and Tools

| | |
|---|---|
| **Lab slides** | [12_sqlite_setup_exercise.pdf](/files/dbis/12_sqlite_setup_exercise.pdf) |

The first lab session. SQLite is introduced as the practice environment for the course — a self-contained, serverless, file-based SQL engine, ideal for learning and prototyping. The lecture covers installation of the `sqlite3` command-line shell and of DB Browser for SQLite (GUI), how to create and open a database file, essential shell commands (`.tables`, `.schema`, `.read`), how to run SQL statements and `.sql` script files, and how to use the GUI for browsing data, editing tables, and running queries.

**Critical reminder:** foreign key enforcement is **off by default** in SQLite. Every session must start with `PRAGMA foreign_keys = ON;` — without it, referential integrity is silently disabled and `ON DELETE CASCADE` does nothing.

**Key focus areas:** being able to open and inspect a SQLite database from both the CLI and the GUI, knowing the difference between SQLite shell commands (start with `.`) and SQL statements (end with `;`), always enabling foreign keys at the start of a session.

---

### Lecture 9 — E-R Recap on the Lab Schemas

| | |
|---|---|
| **Lab slides** | [13_er_recap_exercise.pdf](/files/dbis/13_er_recap_exercise.pdf) |

A quick recap of the E-R model centred on the two schemas that will be used in all the SQL labs: the **Library** schema (users, books, loans) and the **Swimming Pool** schema (customers, subscriptions, lanes, instructors, sessions, bookings). Both schemas are first presented as E-R diagrams and then translated to relational form in the next lecture.

**Key focus areas:** internalising the structure of both lab schemas (you will use them in every lab from now on), recognising entities, relationships, and cardinalities at a glance.

---

### Lecture 10 — From E-R to SQL Schema

| | |
|---|---|
| **Lab slides** | [14_from_er_to_sql_schema_exercise.pdf](/files/dbis/14_from_er_to_sql_schema_exercise.pdf) |
| **Atzeni et al.** | Chapter 4 (data definition) |

The first hands-on SQL session. The Library and Swimming Pool schemas are implemented as `CREATE TABLE` statements, with primary keys, foreign keys (`REFERENCES ... ON DELETE CASCADE`), `NOT NULL`, `UNIQUE` and `CHECK` constraints. Each statement is shown in two versions: **PostgreSQL** (`SERIAL PRIMARY KEY`, full `DECIMAL` precision, `TIME` type) and **SQLite** (`INTEGER PRIMARY KEY` with auto-increment, `TEXT` for time values, `PRAGMA foreign_keys = ON` to enable cascades).

**Key focus areas:** being able to write a `CREATE TABLE` statement with all the relevant constraints, understanding the small but important differences between PostgreSQL and SQLite (auto-increment, type system, foreign key enforcement), reading the schema and visualising the corresponding E-R diagram in your head.

---

### Lecture 11 — SQL: DDL and DML Introduction

| | |
|---|---|
| **Slides** | [15_sql_ddl_dml_intro_theory.pdf](/files/dbis/15_sql_ddl_dml_intro_theory.pdf) |
| **Atzeni et al.** | Chapter 4 |

The minimal SQL vocabulary, presented systematically. **DDL — Data Definition Language**: `CREATE TABLE`, `ALTER TABLE`, `DROP TABLE`. **DML — Data Manipulation Language**: `INSERT INTO`, `SELECT`, `UPDATE`, `DELETE`. For each command, the generic syntax is given and immediately followed by a minimal example. Optional clauses on `SELECT` are introduced: `WHERE`, `ORDER BY`, `GROUP BY`, `HAVING`.

**Key focus areas:** being able to write each command from memory with correct syntax, knowing what each clause of `SELECT` does and in what order they are evaluated (`FROM → WHERE → GROUP BY → HAVING → SELECT → ORDER BY`), understanding the difference between `WHERE` (filters individual rows before grouping) and `HAVING` (filters groups after grouping).

> **Lab exercises — Basic SQL:** two lab sessions use the same set of tasks (INSERT, UPDATE, DELETE, SELECT, aggregates with `COUNT/SUM/AVG/MIN/MAX`, `GROUP BY ... HAVING`) on the two course schemas:
>
> - **Library schema** ([16_sql_basic_library_exercise.pdf](/files/dbis/16_sql_basic_library_exercise.pdf))
> - **Swimming Pool schema** ([17_sql_basic_pool_exercise.pdf](/files/dbis/17_sql_basic_pool_exercise.pdf))
>
> Solve each task on your own first, then compare with the reference solution. By the end of the second schema the syntax should feel routine — at that point focus on *choosing the right aggregate* and *choosing between `WHERE` and `HAVING`*.

---

### Lecture 12 — SQL JOIN: The Theory Behind Combining Tables

| | |
|---|---|
| **Slides** | [18_join_theory.pdf](/files/dbis/18_join_theory.pdf) |
| **Atzeni et al.** | Chapter 4 (join section) |

The conceptual core of advanced SQL. Why JOIN exists (data is split across tables to avoid redundancy), what a join key is (typically primary key on one side, foreign key on the other), and the six types of JOIN — each one answering a different question: `INNER JOIN` (which rows match in both tables?), `LEFT JOIN` (all rows from the left, matches or not), `RIGHT JOIN` (mirror image), `FULL JOIN` (all rows from either side), `CROSS JOIN` (every possible combination), `SELF JOIN` (rows matched against the same table).

**Key focus areas:** the Venn-diagram intuition for each JOIN type (you should be able to draw them on paper), being able to predict the *number of rows* in the result before running the query, recognising which JOIN type fits a given natural-language question. **This is the topic students underperform on at the oral exam.**

---

### Lecture 13 — Advanced SQL — Part 1: JOIN and UNION

| | |
|---|---|
| **Slides** | [19_sql_advanced_join_union_theory.pdf](/files/dbis/19_sql_advanced_join_union_theory.pdf) |
| **Atzeni et al.** | Chapter 4 |

The practical syntax for each JOIN type, followed by `UNION` and `UNION ALL`. Each variant is shown for both PostgreSQL and SQLite. Older versions of SQLite (< 3.39.0, before July 2022) do **not** support `RIGHT JOIN` and `FULL JOIN` — workarounds are presented and should be memorised: a `RIGHT JOIN` is rewritten as a `LEFT JOIN` with swapped tables, and a `FULL JOIN` is emulated as a `UNION` of two `LEFT JOIN`s.

**Key focus areas:** writing every JOIN syntax correctly (including the alias-and-`ON` form), knowing the SQLite workarounds for `RIGHT` and `FULL JOIN`, knowing when `UNION` is needed (combining rows from queries with the same column structure) and the difference between `UNION` (removes duplicates) and `UNION ALL` (keeps them).

---

### Lecture 14 — Advanced SQL — Part 2: Subqueries and Views

| | |
|---|---|
| **Slides** | [20_sql_advanced_subqueries_views_theory.pdf](/files/dbis/20_sql_advanced_subqueries_views_theory.pdf) |
| **Atzeni et al.** | Chapter 4 |

The closing piece of the SQL block. **Subqueries**: in `SELECT` (for derived calculations), in `WHERE` (with `IN`, `EXISTS`, `ANY`, `ALL`, or comparison operators), in `FROM` (as a temporary table). **Views**: how to create one with `CREATE VIEW`, why they are useful (hiding complexity, encouraging reuse, simulating computed columns), and how to remove them with `DROP VIEW`.

**Key focus areas:** recognising which subquery position fits a given problem, mastering the `IN` / `NOT IN` / `EXISTS` / `NOT EXISTS` patterns and being aware of how each one behaves in the presence of `NULL`s, understanding what a view is (a saved query, not a stored table) and when it is the right abstraction.

> **Self-check at the end of the SQL block:** on the Library schema, write a query that lists each user **together with the number of books they have borrowed, including users who have never borrowed anything** (count = 0). If you reach for `LEFT JOIN` + `GROUP BY` without hesitation, you are ready for the second midterm.

---

## Module 2 — NoSQL (Prof. Campanile)

### Lecture 15 — NoSQL Databases — Models, Trade-offs, and Polyglot Persistence

| | |
|---|---|
| **Slides** | [21_nosql_theory.pdf](/files/dbis/21_nosql_theory.pdf) |
| **Atzeni et al.** | Not in the textbook (1999 edition) — lecture material |

The closing lecture of the course. The textbook predates NoSQL and does not cover it, so this lecture is fully based on the slides. Three things you must walk away with:

1. **The CAP theorem.** In a distributed system you can guarantee at most two of: *Consistency*, *Availability*, *Partition tolerance*. Since network partitions are a fact of life, real systems trade off between C and A. Be able to give one concrete example for each side of the trade-off.
2. **The four NoSQL families and a representative product for each.** Key-value stores (Redis, DynamoDB), document stores (MongoDB, Couchbase), column-family stores (Cassandra, HBase), graph databases (Neo4j). For each family, know the typical access pattern it serves and the kind of application that benefits from it.
3. **Polyglot persistence.** Modern systems often combine more than one data store — a relational database for transactional consistency, a document store for the user-facing API, a graph database for recommendations, a key-value cache for hot data. The decision is driven by access patterns, not by ideology.

**Key focus areas:** the CAP theorem with a concrete example per pair (CP, AP), the four NoSQL families and at least one product per family, the idea that "NoSQL" is not a single technology but a family of design choices, the rationale for polyglot persistence.

---

## Lecture-to-Chapter Map

| # | Lecture | Atzeni et al. (chapter) |
|---|---------|--------------------------|
| 01 | Introduction to IS and DBMS | Ch. 1 |
| 02 | Database Design Methodology | Ch. 5 |
| 03 | Conceptual Design — E-R Model | Ch. 6 |
| 04–07 | Worked E-R Design Examples (Univ., Library, E-commerce, Streaming) | Ch. 6 — applied |
| 08 | The Relational Model | Ch. 2 |
| 09 | Logical Design — Overview | Ch. 7 |
| 10 | E-R Restructuring | Ch. 7 (restructuring) |
| 11 | Logical Translation | Ch. 7 (translation) |
| 12–13 | SQLite Setup and E-R Recap (lab) | — (lab support) |
| 14 | From E-R to SQL Schema (lab) | Ch. 4 (data definition) |
| 15 | SQL — DDL and DML Introduction | Ch. 4 |
| 16–17 | Basic SQL Exercises (Library, Pool) | Ch. 4 — applied |
| 18 | SQL JOIN — Theory | Ch. 4 (join section) |
| 19 | Advanced SQL — JOIN and UNION | Ch. 4 |
| 20 | Advanced SQL — Subqueries and Views | Ch. 4 |
| 21 | NoSQL Databases | — (lecture material) |


---

## Practical Study Tips

**Use the textbook.** Slides are condensed; the book at [dbbook.inf.uniroma3.it](https://dbbook.inf.uniroma3.it) expands every topic, gives many additional examples, and provides exercises with solutions. Reading the slides is enough to follow the lectures; the book is what you study from for the exam.

**Run the SQL.** Reading the SQL slides is not enough. Open DB Browser for SQLite, paste the `CREATE TABLE` blocks from Lecture 10, then run every query in Lectures 12 (basic) and 14 (advanced) on your own machine. Break the queries on purpose (wrong join key, missing `GROUP BY`, swapped `ON DELETE` direction) and watch what happens — most learning happens when something fails.

**Always enable foreign keys in SQLite.** Every session: `PRAGMA foreign_keys = ON;` at the top. Otherwise referential integrity is silently disabled and your `ON DELETE CASCADE` will not fire.

**Do the worked examples without the solution first.** The four E-R design examples (University, Library, E-commerce, Streaming) and the basic SQL exercises (Library, Pool) are most useful if you attempt them on your own before reading the proposed solution.

**Keep a one-page cheat sheet** as you go: JOIN types with their Venn diagrams, aggregate functions, the evaluation order (`FROM → WHERE → GROUP BY → HAVING → SELECT → ORDER BY`), the `PRAGMA foreign_keys = ON` reminder. You will want it at the oral exam.

---

## Exam Format

The course offers two paths to the final grade.

**Attending students (path A).** Two **midterm exams** (*prove intercorso*) — the first in Week 8 covers the Database Design portion (E-R model, logical design, normalization); the second in Week 12 covers SQL and the Relational Model. Both midterms are practical, in-class tests. An **oral exam** then completes the assessment.

**Non-attending students (path B).** A single 3-hour **written exam** covering all course topics — Database Design (E-R model, logical design, normalization) and SQL with the Relational Model (algebra, queries, data definition and manipulation) — followed by the oral exam.

**Oral exam — always mandatory, for both paths.** The oral covers the entire syllabus, including the topics of both modules, and the final grade combines the written component and the oral.

**How to prepare for the written part.** Practice translating textual requirements into E-R diagrams (use the four worked examples as templates), then restructure and translate to a relational schema by hand. Practice writing SQL queries on the Library and Swimming Pool schemas — especially queries that combine `JOIN`, `GROUP BY`, and `HAVING`, which are the most discriminating ones. Practice without a SQL tool open: at the exam you will not have one.


---

<small>
**Copyright Notice.**
The lecture slides for this course have been prepared by Prof. Mauro Iacono and Prof. Lelio Campanile and contain material adapted from the following source:

- Slides accompanying *Database Systems: Concepts, Languages and Architectures* by Paolo Atzeni, Stefano Ceri, Stefano Paraboschi and Riccardo Torlone. Copyright &copy; the authors and McGraw-Hill. Used and adapted for educational purposes. The book and its companion materials are freely distributed at [dbbook.inf.uniroma3.it](https://dbbook.inf.uniroma3.it).

All original material in the slides is &copy; the respective authors. The lecture materials are provided for personal study by enrolled students. Redistribution or commercial use is not permitted without explicit authorization from the respective copyright holders.
</small>
