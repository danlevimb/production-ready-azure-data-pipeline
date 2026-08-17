# Known Limitations

**Project:** `production-ready-azure-data-pipeline`

---

## 1. Purpose

This document lists known limitations of the MVP.

The goal is to be honest about what was implemented and what remains outside the initial scope.

---

## 2. MVP Limitations

### 2.1 Single Environment

The MVP uses one development environment.

It does not implement full environment promotion across:

```text
dev → test → prod
```

### 2.2 Basic GitHub Actions Scope

GitHub Actions is initially used for Bicep validation.

Full automated deployment, environment approvals, and release gates are not required for the MVP.

### 2.3 Simple Bicep Baseline

The MVP starts with a simple Bicep baseline.

It does not require a fully modular enterprise Bicep architecture.

### 2.4 Limited Data Validation

The current pipeline focuses on ingestion and operational observability.

Advanced row-level validation and rejected-record routing may be expanded in a future phase.

### 2.5 Minimal Alerting Scope

The alert rule detects failed ADF pipeline/activity records from Log Analytics.

It does not yet implement:

- Escalation policies
- On-call rotations
- ITSM integration
- Incident auto-remediation
- Teams/Slack webhook integration

### 2.6 No Private Endpoints

The MVP does not implement Private Endpoints or full network isolation.

This is a future improvement.

### 2.7 No Enterprise RBAC Matrix

RBAC is implemented for the MVP services and identities, but a full enterprise role matrix is not included.

### 2.8 No Microsoft Purview

Governance, cataloging, lineage, and classification are out of scope for this MVP.

### 2.9 No Databricks or Synapse Processing

This project intentionally avoids Databricks and Synapse to keep the focus on production readiness around ADF, ADLS, Key Vault, Log Analytics, alerts, Bicep, and GitHub Actions.

### 2.10 Cost Awareness Required

Log alerts and action groups may have cost implications.

The alert is useful for demonstration and operational learning, but should be deleted or intentionally preserved after closeout.

---

## 3. Design Rationale

These limitations are intentional.

The purpose of this MVP is not to implement a complete enterprise platform.

The purpose is to demonstrate production-readiness patterns in a focused, cost-aware, explainable way.
