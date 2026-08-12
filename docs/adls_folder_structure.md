# ADLS Folder Structure

**Project:** `production-ready-azure-data-pipeline`  
**Phase:** 1 — Architecture and Scope Definition  
**Status:** MVP decisions confirmed

---

## 1. Confirmed Container Strategy

The MVP uses a single ADLS Gen2 container:

```text
datalake
```

This keeps the MVP simple and cost-aware while still showing production-style folder organization.

---

## 2. Confirmed MVP Layout

```text
datalake/
├── landing/
│   └── retail/
│       └── load_date=YYYY-MM-DD/
├── bronze/
│   └── retail/
│       └── entity=<entity_name>/
│           └── load_date=YYYY-MM-DD/
│               └── run_id=<pipeline_run_id>/
├── rejected/
│   └── retail/
│       └── entity=<entity_name>/
│           └── load_date=YYYY-MM-DD/
│               └── run_id=<pipeline_run_id>/
├── audit/
│   └── pipeline_runs/
│       └── load_date=YYYY-MM-DD/
└── evidence/
    └── screenshots/
```

---

## 3. Traceability Principle

Each data output should be traceable to:

- Source file name
- Load date
- Pipeline run ID
- Entity name
- Success or failure status
