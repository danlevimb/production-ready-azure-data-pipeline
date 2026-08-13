# Phase 6 Execution Guide

**Project:** `production-ready-azure-data-pipeline`  
**Phase:** 6 — Pipeline Build

---

## 1. Before You Start

Confirm Phase 5 succeeded and files exist in:

```text
datalake/landing/retail/load_date=2026-08-12/
```

Expected files:

```text
orders_20260812.csv
payments_20260812.csv
order_items_20260812.csv
```

---

## 2. Create Dataset

In ADF Studio:

```text
Author
→ Datasets
→ New dataset
→ Azure Data Lake Storage Gen2
→ DelimitedText
```

Name:

```text
ds_adls_csv_parameterized
```

Linked service:

```text
ls_adls_prdp_dev
```

Create parameters:

```text
p_directory
p_file_name
```

Set connection:

```text
File system: datalake
Directory: @dataset().p_directory
File name: @dataset().p_file_name
First row as header: true
Delimiter: comma
```

---

## 3. Create Pipeline

Create pipeline:

```text
pl_ingest_retail_files_prdp
```

Add parameters:

```text
p_load_date = 2026-08-12
p_source_system = retail
```

Add variable:

```text
v_entities
Type: Array
```

Set variable value using Set Variable activity:

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

## 4. Add ForEach

ForEach items expression:

```text
@variables('v_entities')
```

Inside ForEach add Copy Data activity.

---

## 5. Configure Copy Activity

Source dataset:

```text
ds_adls_csv_parameterized
```

Source parameters:

```text
p_directory:
@concat('landing/', pipeline().parameters.p_source_system, '/load_date=', pipeline().parameters.p_load_date)

p_file_name:
@item().file_name
```

Sink dataset:

```text
ds_adls_csv_parameterized
```

Sink parameters:

```text
p_directory:
@concat('bronze/', pipeline().parameters.p_source_system, '/entity=', item().entity_name, '/load_date=', pipeline().parameters.p_load_date, '/run_id=', pipeline().RunId)

p_file_name:
@item().file_name
```

---

## 6. Debug Run

Run Debug with:

```text
p_load_date = 2026-08-12
p_source_system = retail
```

Expected result:

```text
Pipeline succeeded
ForEach succeeded
Each Copy activity succeeded
```

---

## 7. Validate Bronze Files

Use Azure Portal or Azure CLI to confirm files exist in:

```text
datalake/bronze/retail/entity=orders/load_date=2026-08-12/run_id=<run_id>/
datalake/bronze/retail/entity=payments/load_date=2026-08-12/run_id=<run_id>/
datalake/bronze/retail/entity=order_items/load_date=2026-08-12/run_id=<run_id>/
```

---

## 8. Publish

After successful debug:

```text
Publish all
```

---

## 9. Completion Signal

Phase 6 is complete when the pipeline is published and a successful execution has created the bronze outputs.
