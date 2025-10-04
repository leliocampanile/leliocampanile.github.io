---
layout: single
title: "Research"
permalink: /research/
author_profile: true
---

# Research Overview

My research investigates how **intelligent and distributed systems** behave under realistic conditions — in terms of **performance, reliability, privacy, and interpretability**.  
Across all domains, a unifying theme is the **quantitative evaluation of non-functional attributes** through *simulation, AI modeling, and explainable analysis*.

Beyond specific technologies or paradigms, my work is driven by a systemic perspective:

> **Evaluation is the connective tissue of intelligence.**

From queueing-based simulations to explainable machine learning and LLM-driven analysis, my goal is to measure the invisible attributes — efficiency, transparency, fairness — that determine the quality of (intelligent) systems.

This view frames evaluation not as a secondary activity, but as a scientific bridge between theory and practice, enabling responsible innovation in complex computational ecosystems.

At the same time, I strive to preserve a **connection with real-world applicability**.
While some research topics inevitably explore **concepts well ahead of their industrial adoption** — such as quantum learning or XAI — the underlying motivation remains deeply practical: to understand, model, and improve how intelligent systems perform and interact in reality.

Ultimately, my research seeks to establish a unified methodology for evaluating intelligent, distributed, and responsible technologies, grounded both in rigorous modeling and in the challenges of contemporary digital society.

Within this larger framework, my current research is articulated into several interrelated lines, each addressing a different layer of the evaluation process:

---

## 1. Performance Evaluation and Modeling of Distributed Intelligent Systems

This research line investigates the **quantitative behavior of distributed intelligent architectures**, particularly those integrating edge computing, blockchain, and IoT.

The methodological focus is on **simulation-based evaluation** and **model-driven performance analysis**, aiming to quantify how design parameters influence throughput, latency, scalability, and resource utilization under realistic operating conditions.

The approach combines discrete-event simulation, analytical modeling, and privacy-aware architectural design to evaluate end-to-end system performance across diverse configurations.

**Highlights**
- Formulation of a **GDPR-compliant edge–blockchain architecture** that balances privacy guarantees with computational efficiency, demonstrating how design parameters influence network saturation and responsiveness.
- Development of an **event-driven simulation** environment (SimPy) capable of modeling multi-tier interactions between edge nodes and blockchain layers, enabling quantitative comparison across workloads and capacities.
- Empirical evaluation of PoW and PoS consensus algorithms under realistic latency and service-time distributions, identifying operational thresholds and scalability limits.
- Introduction of **privacy and compliance constraints as measurable performance dimensions**, establishing a methodological link between functional performance and non-functional attributes such as trust and accountability.

**Keywords:** edge computing, blockchain, simulation modeling, throughput analysis, GDPR compliance, smart city systems.

---

## 2. Quantitative Evaluation Beyond Accuracy: Trustworthiness, Explainability, Privacy

Modern AI systems require more than accuracy — they need **explainability, transparency, and fairness**.  
My work extends *performance evaluation* to these **non-functional attributes**, proposing metrics and simulation methods for quantifying *interpretability, trust, and privacy leakage*.

**Highlights**
- Integration of **SHAP** and **ELI5** explanation layers into industrial AI pipelines.  
- Quantitative **privacy evaluation** via simulated attackers, differential privacy accounting, and information-theoretic leakage measures.  
- Ongoing research for the *Elsevier IoT* special issue “Privacy-Preserving IoT Systems.”

**Keywords:** explainable AI, privacy metrics, differential privacy, trustworthiness, model evaluation.

---

## 3. Emerging AI Paradigms

This research explores **novel computational paradigms** for learning systems and evaluates their *efficiency, scalability, and interpretability* compared to classical deep learning, including *Kolmogorov–Arnold Networks (KANs)* and *Quantum Machine Learning (QML)*.  

The goal is not only to evaluate their **efficiency, interpretability, and scalability** compared to classical deep learning, but also to **experiment with novel computational perspectives** that may shape future architectures.

While these investigations may not always converge into a single integrated framework, they serve as a **continuous source of methodological innovation** — testing how theoretical advances can be connected to measurable performance and explainability.

**Highlights**
- Comparative evaluation of *CNN*, *CNN-KAN*, and *Quantum Convolutional Neural Networks (QCNN)* for image classification tasks.  
- Experimental studies on the **Labeled Faces in the Wild (LFW)** dataset, assessing computational efficiency, gate depth, and robustness to quantum noise.  
- Analysis of **Kolmogorov–Arnold representations** as interpretable, low-dimensional alternatives to traditional neural networks.  
- Exploration of **hybrid architectures** and simulation-based benchmarking as tools to bridge classical and quantum learning paradigms.

**Keywords:** Kolmogorov–Arnold Networks, quantum computing, QCNN, computational efficiency, interpretability, hybrid architectures.

---

## 4. Stylometry, NLP, and LLM-Based Evaluation

This research line investigates **how language models encode, reproduce, and reveal authorship signals**.
Rather than focusing on text generation, it emphasizes **quantitative and qualitative evaluation** measuring stylistic coherence, authorship consistency, and linguistic distinctiveness across human and machine texts.

The goal is to develop computational frameworks that assess how and why language models produce identifiable styles, supporting both authorship analysis and model auditing.


**Highlights**
- Design of evaluation pipelines that combine traditional stylometric features (e.g., Burrows’ Delta, lexical richness, syntactic rhythm) with embedding-based similarity measures for cross-domain authorship detection.
- Exploration of LLM fine-tuning and adaptation (e.g., LoRA-based) to study how stylistic traits emerge, persist, or vanish across training regimes and model families.
- Development of edge–cloud architectures for distributed text analysis, enabling scalable and privacy-aware stylometric evaluation.

**Keywords:** NLP, authorship attribution, stylometry, LLM evaluation, Burrows’ Delta, linguistic fingerprinting, cross-model analysis,

---

## 5. Simulation-Driven Decision Support for Safety and Sustainability

This line investigates **model-based and data-driven evaluation** of industrial and environmental systems, applying *simulation* and *AI reasoning* to support decision making in complex infrastructures.

The approach combines quantitative modeling, data-driven analysis, and AI reasoning to evaluate critical infrastructures under realistic conditions, from nuclear waste management to urban air pollution monitoring.

**Highlights**
- Development of simulation-driven frameworks that integrate safety, sustainability, and privacy into a unified assessment methodology for critical and environmental systems.
- Definition of dual evaluation metrics for safety and sustainability, integrating model-based and data-driven assessment in hybrid frameworks. 
- Application of SimPy-based simulation to model system configurations, resource usage, and trade-offs between reliability and efficiency.
- Development of digital twin–enabled decision support tools for  monitoring and environmental risk mitigation.
- Application of AI and predictive modeling to environmental monitoring and pollution analysis, enabling informed and sustainable decision-making in real-world contexts.


**Keywords:**  safety assessment, sustainability, simulation, environmental monitoring, digital twins, decision support systems, privacy-aware IoT, energy-aware WSNs.

---

##  Research Tools and Frameworks

A key aspect of this research vision is **transforming methodological insights into reproducible tools**.
Several open-source frameworks have been developed — or are currently under development — to make *evaluation, explainability, and simulatio* accessible and experimentally grounded.

- **Blockchain–Edge Simulator** — event-driven framework for modeling and evaluating distributed edge–blockchain architectures under realistic latency and throughput conditions.
- **SHIELD** — ensemble model for AI-text detection and reliability assessment, integrating multiple linguistic and embedding-based classifiers.
- **SamRaterApp** — graphical interface for segmentation mask evaluation, supporting reproducible visual assessment and reviewer agreement metrics.
- **LLMTextCrafter** — experimental pipeline for stylometric and authorship-based evaluation of large language models, , also designed to automate text generation from multiple LLMs for comparative experimentation and reproducible benchmarking.

Together, these tools help a research-to-engineering continuum, where theoretical models, simulation environments, and AI explainability converge into practical infrastructures for scientific evaluation.

---
*For a full list of scientific publications, see the [Publications](/publications/) section.*