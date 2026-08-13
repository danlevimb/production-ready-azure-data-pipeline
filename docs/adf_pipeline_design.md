# ADF Pipeline Design

**Project:** `production-ready-azure-data-pipeline`  
**Phase:** 6 — Pipeline Build  
**Pipeline:** `pl_ingest_retail_files_prdp`

---

## 1. Purpose

This document defines the first ADF pipeline design.

The pipeline copies retail CSV files from the landing zone to the bronze zone while preserving run-level traceability.

---

## 2. Pipeline Parameters

| Parameter | Type | Default Value |
|---|---|---|
| `p_load_date` | string | `2026-08-12` |
| `p_source_system` | string | `retail` |

---

## 3. Pipeline Variable

| Variable | Type | Purpose |
|---|---|---|
| `v_entities` | Array | Stores entity/file metadata used by ForEach |

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

## 4. Activity Flow

```text
Set v_entities
        ↓
ForEach v_entities
        ↓
Copy entity file to bronze
```

---

## 5. Copy Source

Dataset:

```text
ds_adls_csv_parameterized
```

Parameters:

```text
p_directory = landing/@{pipeline().parameters.p_source_system}/load_date=@{pipeline().parameters.p_load_date}
p_file_name = @{item().file_name}
```

---

## 6. Copy Sink

Dataset:

```text
ds_adls_csv_parameterized
```

Parameters:

```text
p_directory = bronze/@{pipeline().parameters.p_source_system}/entity=@{item().entity_name}/load_date=@{pipeline().parameters.p_load_date}/run_id=@{pipeline().RunId}
p_file_name = @{item().file_name}
```

---

## 7. Initial MVP Boundary

This phase focuses on successful ingestion.

Future phases may add file existence checks, schema checks, data validation, audit file generation, rejected-record routing, failure alerts, and operational Log Analytics queries.
