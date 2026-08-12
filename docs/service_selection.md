# Service Selection

**Project:** `production-ready-azure-data-pipeline`  
**Phase:** 1 — Architecture and Scope Definition  
**Status:** MVP decisions confirmed

---

## 1. Selected Services

| Service | Role | Rationale |
|---|---|---|
| Azure Data Factory | Orchestration | Primary orchestrator and strong continuity with previous ADF work. |
| ADLS Gen2 | Storage | Stores landing, bronze, rejected, audit, and evidence outputs. |
| Azure Key Vault | Secret management | Keeps sensitive values out of code and GitHub. |
| Managed Identity | Secure authentication | Enables service-to-service authentication without embedded credentials. |
| Azure Monitor | Monitoring | Provides operational visibility into Azure resource activity and health. |
| Log Analytics | Centralized operational logs | Enables queryable logs, operational review, and alert rules. |
| GitHub Actions | CI/CD workflow | Demonstrates repository-driven validation and delivery discipline. |
| Bicep | Infrastructure as Code | Defines Azure infrastructure in version-controlled files. |

---

## 2. Confirmed MVP Boundaries

| Area | Confirmed Boundary |
|---|---|
| GitHub Actions | Bicep validation first, full deployment optional/future |
| Bicep | Simple single-file baseline first, modular structure future |
| Log Analytics | Minimal but defensible operational visibility |
| Storage | One `datalake` container with folders |
| Sample upload | Scripted upload |
| Validation | Bad rows to `rejected/` plus controlled pipeline status |

---

## 3. Services Intentionally Excluded

| Service | Reason Excluded |
|---|---|
| Azure Databricks | Already covered in previous project; not needed for production-readiness MVP. |
| Azure Synapse | Already covered in previous project; not needed for this MVP. |
| Dedicated SQL Pool | Would introduce unnecessary cost and complexity. |
| Spark Pool | Not required for a small ADF production-readiness pipeline. |
| Power BI | Reporting is not the focus. |
| Microsoft Purview | Governance is a future roadmap project. |
| Private Endpoints | Valuable but too heavy for the first MVP. |
| Event Hubs | Streaming is not the focus of this project. |
