# Phase 6 — Pipeline Build

**Project:** `production-ready-azure-data-pipeline`  
**Phase:** 6 — Pipeline Build  
**Status:** Ready to implement  
**ADF pipeline:** `pl_ingest_retail_files_prdp`

---

## 1. Objective

Build the first Azure Data Factory pipeline for the production-ready Azure data pipeline MVP.

The goal of this phase is to implement a controlled happy path:

```text
ADLS landing CSV files
        ↓
ADF pipeline
        ↓
ADLS bronze output
        ↓
run_id-based traceability
```

This phase intentionally keeps validation light. Detailed data quality and rejected-record handling will be expanded later.

---

## 2. Input Files

The pipeline expects the valid sample files already uploaded by Phase 5:

```text
datalake/landing/retail/load_date=2026-08-12/orders_20260812.csv
datalake/landing/retail/load_date=2026-08-12/payments_20260812.csv
datalake/landing/retail/load_date=2026-08-12/order_items_20260812.csv
```

---

## 3. Output Pattern

The pipeline writes each entity to:

```text
datalake/bronze/retail/entity=<entity_name>/load_date=<p_load_date>/run_id=<pipeline_run_id>/
```

Example:

```text
datalake/bronze/retail/entity=orders/load_date=2026-08-12/run_id=<ADF_RUN_ID>/
```

---

## 4. Pipeline Name

Create this pipeline in ADF Studio:

```text
pl_ingest_retail_files_prdp
```

---

## 5. Required Linked Service

The pipeline uses the linked service created in Phase 4:

```text
ls_adls_prdp_dev
```

Authentication:

```text
Managed Identity
```

---

## 6. Required Dataset

Create one parameterized DelimitedText dataset:

```text
ds_adls_csv_parameterized
```

The dataset should use:

```text
Linked service: ls_adls_prdp_dev
File system / container: datalake
Directory: dynamic parameter
File name: dynamic parameter
First row as header: true
Delimiter: comma
```

Recommended dataset parameters:

| Parameter | Type |
|---|---|
| `p_directory` | string |
| `p_file_name` | string |

---

## 7. Pipeline Parameters

Create these pipeline parameters:

| Parameter | Type | Default Value |
|---|---|---|
| `p_load_date` | string | `2026-08-12` |
| `p_source_system` | string | `retail` |

---

## 8. Entity Metadata

Use a pipeline variable named:

```text
v_entities
```

Type:

```text
Array
```

Value:

```json
[
  {
    "entity_name": "orders",
    "file_name": "orders_20260812.csv"
  },
  {
    "entity_name": "payments",
    "file_name": "payments_20260812.csv"
  },
  {
    "entity_name": "order_items",
    "file_name": "order_items_20260812.csv"
  }
]
```

---

## 9. Activities

Recommended first MVP pipeline:

```text
Set variable: v_entities
        ↓
ForEach entity
        ↓
Copy Data: landing CSV → bronze CSV
```

Inside the ForEach, create one Copy activity.

### Source dataset parameters

```text
p_directory = landing/@{pipeline().parameters.p_source_system}/load_date=@{pipeline().parameters.p_load_date}
p_file_name = @{item().file_name}
```

### Sink dataset parameters

```text
p_directory = bronze/@{pipeline().parameters.p_source_system}/entity=@{item().entity_name}/load_date=@{pipeline().parameters.p_load_date}/run_id=@{pipeline().RunId}
p_file_name = @{item().file_name}
```

---

## 10. Expected Result

After pipeline execution, ADLS should contain:

```text
datalake/bronze/retail/entity=orders/load_date=2026-08-12/run_id=<run_id>/orders_20260812.csv
datalake/bronze/retail/entity=payments/load_date=2026-08-12/run_id=<run_id>/payments_20260812.csv
datalake/bronze/retail/entity=order_items/load_date=2026-08-12/run_id=<run_id>/order_items_20260812.csv
```

---

## 11. Evidence to Capture

Recommended screenshots:

```text
03_pipeline_execution/04_pipeline_canvas.png
03_pipeline_execution/05_pipeline_debug_success.png
03_pipeline_execution/06_bronze_files_created.png
03_pipeline_execution/07_run_id_traceability.png
```

Censor Subscription ID, Tenant ID, Object ID, Principal ID, personal email, connection strings, and secrets.

---

## 12. Completion Criteria

Phase 6 is complete when:

1. Dataset `ds_adls_csv_parameterized` exists.
2. Pipeline `pl_ingest_retail_files_prdp` exists.
3. Pipeline debug run succeeds.
4. All three files are copied from landing to bronze.
5. Bronze path includes `entity`, `load_date`, and `run_id`.
6. Evidence is captured safely.
7. Changes are published in ADF Studio.
