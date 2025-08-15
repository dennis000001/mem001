---
marp: true
paginate: true
theme: default
class: lead
---

# Supermom Next‑Gen Platform
Agentic, AI‑First, Community‑Driven

CTO Candidate Proposal (Summary)

---

## Executive Summary
- Unify existing B2B2C capabilities into an AI‑first, agentic platform
- B2C: AI assistant as core interface across App/Web/WhatsApp
- Community + Token: incentivize participation and quality
- B2B: transparent ROI for brands, attribution, and A/B optimization
- 12–15 months phased rollout with PDPA/GDPR compliance

---

## B2C Experiences
- Trusted Search & RAG with citations and medical disclaimers
- Price Alerts & Savings Paths (subscriptions, stackable deals)
- Benefits/Events (localized), Expo Assistant
- Timeline & Reminders integrated with MA/CRM
- MomGenie 2.0: conversation‑to‑action

---

## Architecture (High‑Level)
- Modular monolith → services; event‑driven
- BFF + API Gateway; Auth/Consent; Profile/Stage
- Content & RAG, Pricing/Deals, Benefits/Events, UGC/KOM
- Token/Rewards, MA/CRM, Brand Console, Agent Orchestrator
- Data Warehouse, Vector DB, Feature Store, LLM Gateway

---

## Agentic AI
- Planner, Knowledge (RAG), Deals, Quests, KOM Ops, MA agents
- Tooling: profile, consent, vector_search, deal_subscribe, ugc_submit, token_mint, etc.
- Feedback loop: explicit/implicit + contextual bandits
- Safety: allowlisted sources, guardrails, audits

---

## Community & Token
- Year 1: off‑chain points; rules engine; redemption store
- Quality & anti‑fraud: scoring, fingerprinting, anomaly detection
- Rewards: moms (surveys/UGC/promo), KOM (quality, on‑time)

---

## B2B Integration
- Brand console: setup, budget/KPI, A/B, attribution, reporting
- Meta Lead sync, exports, optional Clean Room
- Verifiable reporting, audit trails, brand safety

---

## Data, Privacy, Security
- PDPA/GDPR framework; consent granularity; DSR automation
- Encryption (TLS, KMS), RBAC/ABAC, mTLS, VPC isolation
- SIEM/IDS, anomaly detection, backups, vendor DPAs
- AI safety: RAG citations, medical prompts, output audits

---

## Scalability & Future‑Proofing
- Multi‑region, multilingual; LLM gateway for model neutrality
- Cost controls: caching, retrieval‑first, tool calling
- Reliability: idempotency, DLQ, canaries, circuit‑breakers, SLOs

---

## Roadmap & Resourcing
- Phase 0: Foundation (0–6 weeks)
- Phase 1: B2C MVP (Months 2–4)
- Phase 2: Agentic & Token Beta (Months 5–8)
- Phase 3: B2B Scale & Compliance (Months 9–12)
- Squads: B2C; Intelligence & Platform

---

## KPIs
- Moms: MAU/retention, task completion, alerts, UGC, CSAT
- Brands: qualified leads, CPL/CPA, ROI, A/B win rate, KOM delivery

---

## Call to Action
- Approve Phase 0 scope and budget
- Lock initial markets/languages and data sources
- Establish compliance workstream and medical advisory