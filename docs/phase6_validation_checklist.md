# Phase 6 Validation Checklist

**Project:** `production-ready-azure-data-pipeline`  
**Phase:** 6 — Pipeline Build

---

## 1. Dataset Validation

| Check | Expected |
|---|---|
| Dataset exists | `ds_adls_csv_parameterized` |
| Linked service | `ls_adls_prdp_dev` |
| File system | `datalake` |
| Directory parameter | `p_directory` |
| File name parameter | `p_file_name` |
| First row as header | true |

---

## 2. Pipeline Validation

| Check | Expected |
|---|---|
| Pipeline exists | `pl_ingest_retail_files_prdp` |
| Parameter exists | `p_load_date` |
| Parameter exists | `p_source_system` |
| Variable exists | `v_entities` |
| ForEach loops over | `@variables('v_entities')` |
| Copy activity source | landing path |
| Copy activity sink | bronze path |
| Sink path includes | entity, load_date, run_id |

---

## 3. Execution Validation

| Check | Expected |
|---|---|
| Debug run status | Succeeded |
| Orders copied | Yes |
| Payments copied | Yes |
| Order items copied | Yes |
| Bronze output path exists | Yes |
| Run ID included in path | Yes |

---

## 4. Evidence Validation

Capture:

```text
03_pipeline_execution/04_pipeline_canvas.png
03_pipeline_execution/05_pipeline_debug_success.png
03_pipeline_execution/06_bronze_files_created.png
03_pipeline_execution/07_run_id_traceability.png
```

Do not expose Subscription ID, Tenant ID, Object ID, Principal ID, personal email, or secrets.
