# Public Repository Structure

**Project:** `production-ready-azure-data-pipeline`  
**Phase:** 1 — Architecture and Scope Definition  
**Status:** MVP decisions confirmed

---

## 1. Proposed Structure

```text
production-ready-azure-data-pipeline/
├── README.md
├── docs/
│   ├── architecture_and_scope.md
│   ├── service_selection.md
│   ├── source_data_model.md
│   ├── adls_folder_structure.md
│   ├── security_strategy.md
│   ├── monitoring_and_observability.md
│   ├── cicd_strategy.md
│   ├── infrastructure_as_code_strategy.md
│   ├── evidence_checklist.md
│   ├── cost_controls.md
│   ├── public_repo_structure.md
│   ├── implementation_plan.md
│   └── phase1_closure_review.md
├── diagrams/
│   └── README.md
├── infra/
│   ├── main.bicep
│   ├── parameters.dev.json
│   └── README.md
├── scripts/
│   └── README.md
├── sample-data/
│   └── README.md
└── evidence/
    └── README.md
```

---

## 2. Public Safety Rule

Do not commit:

- Secrets
- Keys
- SAS tokens
- Connection strings
- Passwords
- Personal emails
- Raw screenshots with sensitive identifiers
- Azure subscription or tenant identifiers unless intentionally censored
