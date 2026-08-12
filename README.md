# Production-Ready Azure Data Pipeline

**Status:** Phase 1 — Architecture and Scope Definition / MVP decisions confirmed  
**Project type:** Public portfolio project  
**Orchestrator:** Azure Data Factory  
**Storage:** Azure Data Lake Storage Gen2  
**Secrets:** Azure Key Vault  
**Monitoring:** Azure Monitor / Log Analytics  
**Deployment:** GitHub Actions + Bicep  
**Approach:** Hybrid approach — small fresh pipeline with continuity from previous retail/order-processing portfolio themes

---

## 1. Project Purpose

This project demonstrates how a small Azure data pipeline can be designed with production-readiness patterns from the beginning.

The project is not meant to prove large-scale data processing.

The project is meant to prove operational maturity.

Professional question:

```text
Can I move beyond a working data pipeline and make it secure, observable, deployable, maintainable, and operationally defensible?
```

---

## 2. Confirmed MVP Decisions

| Area | Decision |
|---|---|
| Orchestration | Azure Data Factory |
| Storage | ADLS Gen2 |
| Storage layout | Single ADLS container named `datalake` |
| Secret management | Azure Key Vault |
| Identity | Managed Identity |
| Monitoring | Azure Monitor / Log Analytics |
| Monitoring depth | Minimal but defensible Log Analytics |
| CI/CD | GitHub Actions |
| CI/CD scope | Bicep validation first |
| Infrastructure as Code | Bicep |
| Bicep structure | Simple single-file baseline first; modular structure deferred |
| Source data | Small retail/order-processing CSV files |
| Sample upload | Scripted upload |
| Validation behavior | Bad rows to `rejected/` plus controlled pipeline status |
| Scope style | Hybrid approach: small new pipeline inspired by previous themes |

---

## 3. Initial Repository Structure

```text
production-ready-azure-data-pipeline/
├── README.md
├── docs/
├── diagrams/
├── infra/
├── scripts/
├── sample-data/
└── evidence/
```

---

## 4. Phase 1 Documents

| Document | Purpose |
|---|---|
| `docs/architecture_and_scope.md` | Defines project mission, scope, and architecture |
| `docs/service_selection.md` | Explains why each Azure service is included |
| `docs/source_data_model.md` | Defines sample retail/order-processing data |
| `docs/adls_folder_structure.md` | Defines the `datalake` container layout |
| `docs/security_strategy.md` | Defines Managed Identity, Key Vault, and secret-free repo strategy |
| `docs/monitoring_and_observability.md` | Defines run correlation, logs, alerts, and operational visibility |
| `docs/cicd_strategy.md` | Defines GitHub Actions and Bicep validation strategy |
| `docs/infrastructure_as_code_strategy.md` | Defines Bicep scope and deployment approach |
| `docs/evidence_checklist.md` | Defines required evidence for the public repo |
| `docs/cost_controls.md` | Defines cost-control boundaries |
| `docs/public_repo_structure.md` | Defines expected public repo layout |
| `docs/implementation_plan.md` | Defines implementation phases |
| `docs/phase1_closure_review.md` | Defines Phase 1 completion criteria |

---

## 5. Current Next Action

Approve Phase 1 and move into:

```text
Phase 2 — Public Repository Setup
```
