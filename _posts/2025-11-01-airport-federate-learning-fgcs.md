---
title: "Facial Recognition, Privacy, and Airports: Our Take on a Federated Approach"
subtitle: "How Multi-Level Federated Learning Can Protect Biometric Data in Smart Airports"
permalink: /blog/airport-federated-learning-fgcs/
date: 2025-11-01
tags: [Federated Learning, Privacy, research, AI, ML, FL]
---

![Headline Image](/images/fgcs-airport-head-line.jpg)

## 1. Why Talk About Biometrics and Privacy at Airports Today?

Airports are rapidly evolving into hyper-automated environments.  
From self-service check-in kiosks to biometric boarding gates, **facial recognition systems** are becoming a central element of passenger processing.  
These technologies promise convenience, speed, and improved security — but they also raise pressing concerns about **privacy, data control, and surveillance**.

When your face becomes your passport, how is your data stored, processed, and protected?  
Can we trust these systems not only to recognize us — but also to respect our rights?

Artificial intelligence (AI) and machine learning play a dual role here.  
They power the recognition systems that drive automation, but they also open up new ways to rethink how sensitive data is managed — especially through **Federated Learning (FL)**, which allows AI models to be trained collaboratively **without centralizing personal data**.

---

## 2. A Federated Architecture to Protect Biometric Data

Our recent study, published in *Future Generation Computer Systems*, explores how a **multi-level federated learning architecture** can safeguard biometric data in airport environments.

Federated Learning shifts the model training process from a central server to distributed devices.  
Instead of sending raw data to a central authority, each device (or node) trains a local model and shares only model updates. This approach preserves data locality and significantly reduces exposure.

But what happens when multiple organizations — airlines, airport authorities, and government entities — are involved?  
That’s where our architecture comes in.

We designed a **three-tiered system** tailored to the airport context:

- **Client Level:** Check-in kiosks capture and preprocess biometric data locally.  
- **Edge Level:** Airline servers act as local aggregators, combining updates from their own kiosks.  
- **Global Level:** An airport-wide coordinator aggregates models across airlines without ever accessing raw data.

This structure supports organizational autonomy, **compliance with data protection laws**, and **scalability** — all critical for real-world deployments.

---

## 3. Privacy by Design: Techniques We Adopted

From the beginning, our goal was to embed privacy directly into the architecture — not to patch it afterward.  
This embodies the **privacy by design** principle.

To achieve this, we combined complementary privacy-enhancing techniques:

- **Differential Privacy (DP):** Adds mathematical noise to model updates, making it difficult to reverse-engineer original data — even if the model is compromised.  
- **Secure Aggregation (SA):** Ensures that individual updates cannot be accessed by the server, not even during training.  
- **Privacy Meter:** An open-source tool that audits privacy using *membership inference attacks* (MIA), simulating how an adversary might guess if someone’s data was part of training.  
- **Data Protection Impact Assessment (DPIA):** A GDPR-aligned framework for evaluating privacy risks and mitigation strategies.

Together, these tools provide both **quantitative** and **qualitative** insights into the system’s privacy guarantees.

---

## 4. What We Discovered

Our experimental evaluation compared three configurations:

1. **Centralized Training:** Highest accuracy but strong vulnerability to inference attacks.  
2. **One-Level FL:** Improved privacy, but organizational bottlenecks limited scalability.  
3. **Two-Level FL with DP and SA:** Slight accuracy drop, but significantly higher robustness and privacy protection.

The **Privacy Meter results** confirmed that privacy-preserving mechanisms substantially reduced the risk of data leakage — even under simulated attacks.  
The trade-off between accuracy and privacy proved manageable, especially considering the sensitive nature of biometric systems.

---


This research contributes to the broader conversation on **trustworthy AI** — how to design systems that are both powerful and privacy-respecting.

For stakeholders such as airport operators, data protection officers, and public institutions, our architecture offers view about:

- Aligns with **GDPR principles** (data minimization, security by design);  
- Supports **decentralized governance** across multiple organizations;  
- Is **adaptable** to other sensitive domains such as healthcare and smart cities.

As airports and public infrastructures continue to adopt AI-driven automation, our work shows that **privacy and performance do not have to be mutually exclusive**.

Future developments will explore:
- Formal verification of security properties,  
- Real-world deployment pilots, and  
- Integration with advanced cryptographic protocols.

---

**Read the full open-access paper [here](https://www.sciencedirect.com/science/article/pii/S0167739X25005114)** 

cite it:

{% reference CAMPANILE2026108217 %}

---

*Published in* **Future Generation Computer Systems**, *Elsevier (2026)*  
**Authors:** Lelio Campanile, Maria Stella De Biase, Fiammetta Marulli  
*Department of Mathematics and Physics, Università della Campania “L. Vanvitelli”*