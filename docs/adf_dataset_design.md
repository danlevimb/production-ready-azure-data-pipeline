# ADF Dataset Design

**Project:** `production-ready-azure-data-pipeline`  
**Phase:** 6 — Pipeline Build

---

## 1. Purpose

This document defines the ADF dataset used by the first MVP pipeline.

The dataset is intentionally parameterized so it can read or write multiple CSV files using the same dataset object.

---

## 2. Dataset Name

```text
ds_adls_csv_parameterized
```

---

## 3. Dataset Type

```text
DelimitedText
```

---

## 4. Linked Service

```text
ls_adls_prdp_dev
```

---

## 5. Dataset Parameters

| Parameter | Type | Purpose |
|---|---|---|
| `p_directory` | string | ADLS folder path |
| `p_file_name` | string | CSV file name |

---

## 6. Connection Settings

| Setting | Value |
|---|---|
| File system | `datalake` |
| Directory | `@dataset().p_directory` |
| File name | `@dataset().p_file_name` |
| First row as header | `true` |
| Column delimiter | comma |
| Row delimiter | default |
| Encoding | UTF-8 |

---

## 7. Design Reason

One parameterized dataset is better than creating separate datasets for every entity. It keeps the pipeline smaller and easier to maintain.
