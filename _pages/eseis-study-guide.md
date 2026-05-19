---
title: "ESEIS — Study Guide for Students"
permalink: /teaching/eseis/study-guide/
layout: single
author_profile: true
toc: true
toc_label: "Lectures"
toc_icon: "book-open"
toc_sticky: true
---

**[Back to Course Page](/teaching/eseis/)**

> This guide covers the **Software Engineering module (6 ECTS)** taught by Prof. Ing. Lelio Campanile, PhD. The course also includes an **Information Systems module (3 ECTS)** taught by Prof. Mauro Iacono.

## How to Use This Guide

The course is organized in two tracks: a main path following Sommerville (Lectures 1–9) and a dedicated UML module (Lectures A1–B3) that comes right after Lecture 4 (Requirements Engineering). For each lecture you will find the chapters to study, the topics covered, and advice on where to focus your attention. In-class exercises are indicated at the point in the syllabus where they take place.

## Textbooks

| Book | Role |
|------|------|
| **I. Sommerville, *Software Engineering*, 10th ed., Pearson** | Main textbook — all lectures follow this book |
| **M. Seidl, M. Scholz, C. Huemer, G. Kappel, *UML @Classroom*, Springer** | Supplementary reference for the UML module |

---

## Part I — Software Engineering Fundamentals

### Lecture 1 — Introduction to Software Engineering

| | |
|---|---|
| **Slides** | [1-ESEIS.pdf](/files/eseis/1-ESEIS.pdf) |
| **Sommerville** | Chapter 1 |

This lecture introduces software engineering as a discipline. It covers the concepts of software products (generic vs. customized), the fundamental activities of the development process (specification, development, validation, evolution), and the main software quality attributes. Professional ethics in software engineering is also discussed.

**Key focus areas:** the basic definitions (what software engineering is, why it matters), the difference between generic and custom software, the four essential attributes of good software (maintainability, dependability, efficiency, acceptability).

---

### Lecture 2 — Software Processes

| | |
|---|---|
| **Slides** | [2-ESEIS.pdf](/files/eseis/2-ESEIS.pdf) |
| **Sommerville** | Chapter 2 |

The main software process models are examined. The waterfall model is presented with its phases and its main limitation: the difficulty of accommodating change. This is followed by incremental development and the integration and configuration model (reuse-oriented). The cross-cutting process activities are then explored: requirements engineering, design, implementation, validation, and evolution. Finally, the Rational Unified Process (RUP) is introduced as an example of a modern process model.

**Key focus areas:** being able to describe and compare the three process models (waterfall, incremental, integration/configuration), understanding why waterfall is rigid and when it may be appropriate, knowing the activities common to all processes.

---

### Lecture 3 — Agile Software Development

| | |
|---|---|
| **Slides** | [3-ESEIS.pdf](/files/eseis/3-ESEIS.pdf) |
| **Sommerville** | Chapter 3 |

Starting from the context that led to agile methods — the need for rapid development in environments with unstable requirements. The Agile Manifesto and its principles are presented, followed by specific techniques: Extreme Programming (XP) with its practices (pair programming, TDD, continuous integration, refactoring), user stories, and requirements management in an agile context. Significant attention is given to Scrum (roles, events, artifacts) and agile project management. The lecture closes with the challenge of scaling agile for large projects and organizations.

**Key focus areas:** the four values of the Agile Manifesto, the key XP practices, the Scrum framework in detail (roles: Product Owner, Scrum Master, Development Team; events: Sprint, Sprint Planning, Daily Scrum, Sprint Review, Sprint Retrospective; artifacts: Product Backlog, Sprint Backlog), the difference between plan-driven and agile approaches.

> **In-class exercise — Scrum in Practice** ([Ex-1-SCRUM.pdf](/files/eseis/Ex-1-SCRUM.pdf)): a group simulation of Sprint Planning. The scenario involves a startup team building a customer analytics dashboard for a supermarket chain. Hands-on practice with backlog, estimation, Scrum roles, and Daily Scrum.

---

## Part II — Requirements, UML, and Modeling

### Lecture 4 — Requirements Engineering

| | |
|---|---|
| **Slides** | [4_0-ESEIS.pdf](/files/eseis/4_0-ESEIS.pdf) |
| **Sommerville** | Chapter 4 |

The heart of analysis: how to gather, document, and validate what a system should do. A distinction is made between user requirements (high-level, natural language) and system requirements (detailed, precise). The distinction between functional requirements (what the system does) and non-functional requirements (quality constraints: performance, security, usability) is fundamental. The entire requirements engineering process is covered — elicitation, specification, validation — along with requirements change management.

**Key focus areas:** being able to distinguish and write functional and non-functional requirements, knowing elicitation techniques (interviews, scenarios, use cases), understanding the importance of requirements validation, knowing the structure of a requirements document (SRS).

> **In-class exercise — Requirements Analysis** ([Ex-1-Requirements.pdf](/files/eseis/Ex-1-Requirements.pdf)): a practical exercise on the "UniStudy" system, a university platform. Students must identify actors, write user requirements and system requirements, and classify non-functional requirements.

---

### UML Module — System Modeling & UML

This block of lectures comes right after Lecture 4 and explores UML in depth using both textbooks. The slides explicitly reference UML @Classroom chapters. The running example throughout is the **Student Administration System**.

#### Lecture A1 — Introduction to Object-Oriented Modeling

| | |
|---|---|
| **Slides** | [4_1-UML-1-eseis_system_modeling_uml.pdf](/files/eseis/4_1-UML-1-eseis_system_modeling_uml.pdf) |
| **Sommerville** | Chapter 5 (system modeling sections) |
| **UML @Classroom** | Chapters 1–2 |

Why model? Motivations (communication across roles, abstraction, early error detection), static vs. dynamic perspectives, UML diagram families, levels of abstraction, and how UML fits into the development process.

**Key focus areas:** understanding the distinction between static modeling (what exists, how it is structured) and dynamic modeling (what happens, in what order), knowing the five diagrams covered in the course and what each one is for.

---

#### Lecture A2 — Use Case Diagram

| | |
|---|---|
| **Slides** | [4_2-UML-2-eseis_use_case_diagram.pdf](/files/eseis/4_2-UML-2-eseis_use_case_diagram.pdf) |
| **UML @Classroom** | Chapter 6 |

Use case diagrams represent system functionality from the users' perspective. The lecture starts by connecting functional requirements to use cases (user stories to use cases). It covers actors (primary, secondary, human, system), use cases, actor-use case relationships (association) and relationships between use cases (include, extend, generalization) and between actors (generalization). It also includes best practices, typical mistakes to avoid, and the template for textual use case descriptions.

**Key focus areas:** being able to build a Use Case Diagram from a textual description, correctly using include and extend (the difference is essential!), writing a textual use case description, avoiding the most common mistakes (overly technical use cases, confusing actions with use cases).

---

#### Lecture A3 — Class Diagram

| | |
|---|---|
| **Slides** | [4_3-UML-3-eseis_class_diagram.pdf](/files/eseis/4_3-UML-3-eseis_class_diagram.pdf) |
| **UML @Classroom** | Chapter 3 |

The class diagram is the core of static modeling. Starting from objects and object diagrams, it moves to classes with their three-compartment notation (name, attributes, operations). Attribute syntax (visibility, type, multiplicity, properties) and operation syntax are explored in detail, along with class variables and class operations. For relationships: binary associations (navigability, multiplicity, roles), n-ary associations, association classes, aggregation and composition, generalization (inheritance). Finally, levels of detail (from overview to implementation) and code generation from diagrams.

**Key focus areas:** being able to read and draw a class diagram with correct attributes, operations, and relationships; mastering the difference between aggregation and composition; understanding multiplicity; being able to translate between a class diagram and code.

---

#### Lecture B1 — Sequence Diagram

| | |
|---|---|
| **Slides** | [4_4-UML-4-eseis_sequence_diagram.pdf](/files/eseis/4_4-UML-4-eseis_sequence_diagram.pdf) |
| **UML @Classroom** | Chapter 4 |

Moving to dynamic modeling. The Sequence Diagram describes the interaction between objects for a specific scenario (a concrete execution of a use case). Core elements: interaction partners (lifelines), message types (synchronous, asynchronous, return), activation bars, object creation and destruction, found and lost messages. Then combined fragments: alt (if/else), opt (if), loop (repetition), par (parallel execution), ref (reference to another diagram).

**Key focus areas:** being able to build a sequence diagram from a textual use case scenario, correctly using combined fragments (especially alt, loop, and opt), understanding the link with the Use Case Diagram (each sequence diagram corresponds to one scenario of a use case) and with the Class Diagram (the interacting objects are instances of the classes).

---

#### Lecture B2 — Activity Diagram

| | |
|---|---|
| **Slides** | [4_5-UML-5-eseis_activity_diagram.pdf](/files/eseis/4_5-UML-5-eseis_activity_diagram.pdf) |
| **UML @Classroom** | Chapter 5 |

The Activity Diagram describes the flow of control (and optionally data) through a system. It models business processes, workflows, and algorithms. Core elements: initial/final node, action, control flow, decision/merge node, fork/join node (parallelism), object node (data flow). Advanced elements: swimlanes (partitions by actor/component), comparison with the Sequence Diagram, application to data pipelines.

**Key focus areas:** the key difference from the Sequence Diagram (who sends what to whom vs. flow of steps), using fork/join for parallelism, using decision/merge for conditional choices, knowing when to prefer an Activity Diagram over a Sequence Diagram. For Data Scientists: the Activity Diagram is very natural for modeling data pipelines.

---

#### Lecture B3 — State Machine Diagram

| | |
|---|---|
| **Slides** | [4_6-UML-6-eseis_state_machine_diagram.pdf](/files/eseis/4_6-UML-6-eseis_state_machine_diagram.pdf) |
| **UML @Classroom** | Chapter 7 |

The State Machine Diagram models the lifecycle of a single object: what states it can be in and how it transitions from one state to another in response to events. Core elements: states (simple, initial, final), transitions with their labels (event [guard] / action), internal transitions, entry/exit actions. Advanced elements: composite states (nesting), orthogonal regions (concurrency), history pseudostate.

**Key focus areas:** being able to build a state machine diagram for an object with a complex lifecycle (e.g., an order, an enrollment, a ticket), understanding transition syntax (event [guard] / action), the difference from the Activity Diagram (a state machine follows ONE object, an activity follows a process).

> **In-class exercise — UML Design Exercise** ([Ex-3-UML.pdf](/files/eseis/Ex-3-UML.pdf)): the second part of the "UniStudy" exercise. Starting from the requirements and Use Case Diagram produced in the previous exercise, students move to design: Class Diagram, Sequence Diagram, and Activity Diagram for the system.

---

## Part III — System Modeling, Design, Testing, and Evolution

### Lecture 5 — System Modeling

| | |
|---|---|
| **Slides** | [5-ESEIS.pdf](/files/eseis/5-ESEIS.pdf) |
| **Sommerville** | Chapter 5 |

After practicing UML in the previous module, this lecture frames system modeling in a broader perspective. Four types of models are covered: context models (system boundaries), interaction models (how the system interacts with its environment), structural models (internal organization), behavioral models (dynamic behavior). Model-Driven Engineering (MDE/MDA) is also introduced.

**Key focus areas:** understanding what each type of model is for, when to use models of the existing system vs. the new system, how the UML diagrams just studied fit into the different model categories (use case and sequence as interaction models, class diagram as structural models, activity and state machine as behavioral models).

---

### Lecture 6 — Architectural Design

| | |
|---|---|
| **Slides** | [6-ESEIS.pdf](/files/eseis/6-ESEIS.pdf) |
| **Sommerville** | Chapter 6 |

How to organize the overall structure of a software system. Architectural decisions, architectural views (logical, process, development, physical), and the main architectural patterns are covered: MVC, layered, repository, client-server, pipe and filter. The lecture closes with application architectures (transaction processing, information systems).

**Key focus areas:** being able to describe the main architectural patterns and when to use them, understanding the relationship between architecture and non-functional requirements, knowing the architectural views and their purpose. Remember that even in agile processes, architecture is designed in the early stages, because architectural refactoring is expensive.

---

### Lecture 7 — Design and Implementation

| | |
|---|---|
| **Slides** | [7-ESEIS.pdf](/files/eseis/7-ESEIS.pdf) |
| **Sommerville** | Chapter 7 |

Moving from the architectural level to detailed design and implementation. Object-oriented design using UML (connecting back to the UML module), design patterns (an introduction), implementation issues (reuse, configuration management, host-target development), and open source development.

**Key focus areas:** understanding how to go from architecture to detailed design, the "build or buy" approach (COTS), the concept of design patterns, practical implementation choices.

---

### Lecture 8 — Software Testing

| | |
|---|---|
| **Slides** | [8-ESEIS.pdf](/files/eseis/8-ESEIS.pdf) |
| **Sommerville** | Chapter 8 |

Testing is meant to show that software does what it is supposed to do and to discover defects. A distinction is made between validation testing (does it meet requirements?) and defect testing (finding bugs). The lecture covers: development testing (unit test, component test, system test), Test-Driven Development (TDD), release testing (requirements-based, scenario-based, performance testing), and user testing (alpha, beta, acceptance testing).

**Key focus areas:** the difference between verification and validation, the levels of testing (unit, component, system), the TDD process and why it is linked to agile, test case design techniques (equivalence partitioning, boundary value analysis), the difference between release testing and user testing.

---

### Lecture 9 — Software Evolution

| | |
|---|---|
| **Slides** | [9-ESEIS.pdf](/files/eseis/9-ESEIS.pdf) |
| **Sommerville** | Chapter 9 |

Software changes constantly: new requirements, bug fixes, adaptation to new environments. The spiral model of development and evolution is presented, along with evolution processes (change request, impact analysis, release planning, implementation), legacy systems (what they are, how to assess them, deciding whether to maintain or replace them), and software maintenance (corrective, adaptive, perfective) with its costs.

**Key focus areas:** understanding why evolution consumes the majority of the software budget in large organizations, the types of maintenance, how to assess a legacy system (business value vs. technical quality), Lehman's laws of software evolution.

---

## Lecture-to-Chapter Map

| Lecture | Topic | Sommerville (10th ed.) | UML @Classroom |
|---------|-------|----------------------|----------------|
| 1 | Introduction to SE | Ch. 1 | — |
| 2 | Software Processes | Ch. 2 | — |
| 3 | Agile Software Development | Ch. 3 | — |
| 4 | Requirements Engineering | Ch. 4 | — |
| A1 | Intro to OO Modeling & UML | Ch. 5 (overview) | Ch. 1–2 |
| A2 | Use Case Diagram | — | Ch. 6 |
| A3 | Class Diagram | — | Ch. 3 |
| B1 | Sequence Diagram | — | Ch. 4 |
| B2 | Activity Diagram | — | Ch. 5 |
| B3 | State Machine Diagram | — | Ch. 7 |
| 5 | System Modeling | Ch. 5 | — |
| 6 | Architectural Design | Ch. 6 | — |
| 7 | Design and Implementation | Ch. 7 | — |
| 8 | Software Testing | Ch. 8 | — |
| 9 | Software Evolution | Ch. 9 | — |

---

## Practical Study Tips

**On Sommerville:** read the chapters in the order shown in the table above. Each chapter ends with a "Key Points" section — use it as a checklist to verify you have understood the main concepts. The examples in the book differ from those in the lectures, and that is a good thing: they give you a second perspective on the same concepts.

**On UML @Classroom:** use it as a reference for UML notation. When studying a diagram, try to redo the examples from the book and the slides by hand, without looking at the solution. UML modeling is learned by doing, not by reading.

**On the exercises:** the three exercises (Scrum, Requirements, UML Design) are built as a progressive path, especially the last two which work on the same "UniStudy" system. Review them before the exam as they give you a concrete idea of how to connect theory and practice.

**The thread running through the course:** the course follows the software lifecycle. It starts with process theory (Lectures 1–3), moves to requirements gathering (Lecture 4), then to UML modeling (module A1–B3), system modeling in a broader perspective (Lecture 5), architectural and detailed design (Lectures 6–7), testing (Lecture 8), and evolution (Lecture 9). Keeping this path in mind helps you not lose the big picture.

---

## Exam Format

The final exam consists of two parts: a written exam and an oral exam. Access to the oral exam is conditional on passing the written part.

**Written exam** — This is a pen-and-paper exam, with no electronic devices allowed. The exam focuses on two main areas: requirements specification (with possible references to agile methodologies) and design with UML. In practice, expect to analyze a textual description of a system and produce from it specification documents (functional and non-functional requirements, user stories) and UML diagrams (use case, class, sequence, activity, state machine). The in-class exercises on "UniStudy" are an excellent reference for understanding the type of work required.

**Oral exam** — Accessible only after passing the written exam. The oral exam covers all course topics, including the **Information Systems** module (Prof. Iacono), which is assessed exclusively during the oral exam.

**How to prepare for the written exam:** practice drawing UML diagrams by hand starting from textual descriptions. Speed and precision in notation matter: you will not have a software tool available, so diagram syntax (multiplicity, arrows, stereotypes, combined fragments) must be well memorized. Redo the in-class exercises and try inventing new scenarios to model.

---

<small>
**Copyright Notice.**
The lecture slides for this course have been prepared by Prof. Lelio Campanile and contain material adapted from the following sources:

- Slides accompanying *Software Engineering*, 10th edition, by Ian Sommerville. Copyright &copy; Ian Sommerville and Pearson Education Limited. Used and adapted for educational purposes.
- Slides accompanying *UML @Classroom*, by Martina Seidl, Marion Scholz, Christian Huemer, and Gerti Kappel. Copyright &copy; the authors and Springer-Verlag. Used and adapted for educational purposes.

All original material in the slides is &copy; Lelio Campanile. The lecture materials are provided for personal study by enrolled students. Redistribution or commercial use is not permitted without explicit authorization from the respective copyright holders.
</small>
