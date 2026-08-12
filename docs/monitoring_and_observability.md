# Monitoring and Observability Strategy

**Project:** `production-ready-azure-data-pipeline`  
**Phase:** 1 — Architecture and Scope Definition  
**Status:** MVP decisions confirmed

---

## 1. Confirmed Monitoring Depth

The MVP uses:

```text
Log Analytics minimalista pero defendible.
```

This means the project should include enough telemetry and queries to prove operational visibility without building an enterprise observability platform.

---

## 2. Observability Goals

The project should make it possible to answer:

- Did the pipeline run?
- Did it succeed or fail?
- What file or entity was processed?
- How many rows were processed?
- What was rejected?
- What error occurred?
- What run ID should be used to investigate?
- Was an alert triggered?
- Where can an operator look for details?

---

## 3. Correlation Strategy

Every run should be traceable by:

```text
pipeline_run_id
load_date
entity_name
source_file_name
```

---

## 4. Logging Strategy

| Log Type | Location |
|---|---|
| ADF pipeline execution logs | Azure Data Factory Monitor |
| Operational logs | Log Analytics |
| Audit files | ADLS Gen2 `audit/` |
| Rejected records | ADLS Gen2 `rejected/` |
| Deployment logs | GitHub Actions |

---

## 5. Alert Strategy

Minimum alert scenarios:

| Scenario | Alert Intent |
|---|---|
| Pipeline failure | Notify operator that ingestion failed |
| Validation failure | Notify operator that data was rejected or failed checks |
| Missing file | Notify operator that expected input is missing |

The MVP only needs one implemented alert if the rest are documented as future improvements.
