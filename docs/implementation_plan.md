# Implementation Plan

**Project:** `production-ready-azure-data-pipeline`  
**Phase:** 1 — Architecture and Scope Definition  
**Status:** MVP decisions confirmed

---

## 1. Implementation Phases

### Phase 1 — Architecture and Scope Definition

Deliver architecture, scope, service selection, security, monitoring, CI/CD, IaC, evidence, and repo structure docs.

### Phase 2 — Public Repository Setup

Deliver public repo, initial folders, README, and Phase 1 docs.

### Phase 3 — Infrastructure as Code Baseline

Deliver simple Bicep baseline, `main.bicep`, `parameters.dev.json`, storage account, `datalake` container, ADF, Key Vault, Log Analytics, and deployment notes.

### Phase 4 — Security Configuration

Deliver Managed Identity, Key Vault, secure linked services, RBAC/access documentation, and secret-free validation.

### Phase 5 — Sample Data and Scripted Upload

Deliver sample CSV files, upload script, upload validation, and ADLS landing evidence.

### Phase 6 — Pipeline Build

Deliver ADF pipeline, parameterized file ingestion, landing/bronze output, audit output, rejected/failure path, and controlled pipeline status.

### Phase 7 — Monitoring and Observability

Deliver ADF monitoring evidence, Log Analytics queries, operational review, alert strategy, and failure scenario evidence.

### Phase 8 — CI/CD Validation

Deliver GitHub Actions workflow, Bicep validation workflow, workflow evidence, and deployment documentation.

### Phase 9 — Evidence and Documentation Closeout

Deliver evidence index, known limitations, future improvements, cost controls, final README, public repo QA, and roadmap update.

### Phase 10 — Companion Dojo Decision

Decide dojo name and scope after the public project scope is stable.
