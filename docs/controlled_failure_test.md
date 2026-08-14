# Controlled Failure Test

**Project:** `production-ready-azure-data-pipeline`  
**Phase:** 8 — Failure Diagnostics and Alerting

---

## 1. Purpose

This test intentionally causes the ADF pipeline to fail in a controlled way.

The goal is not to break the project.

The goal is to prove that failures are observable.

---

## 2. Failure Strategy

The happy-path load date is:

```text
2026-08-12
```

The controlled failure load date is:

```text
2099-01-01
```

No files should exist in:

```text
landing/retail/load_date=2099-01-01/
```

This should cause the Copy activity to fail when it tries to read the missing file path.

---

## 3. ADF Debug Test

Run the pipeline with:

| Parameter | Value |
|---|---|
| `p_load_date` | `2099-01-01` |
| `p_source_system` | `retail` |

Expected result:

```text
copy_entity_to_bronze fails
foreach_entity fails
pipeline fails
```

---

## 4. ADF Trigger Test

For stronger monitoring evidence, publish the pipeline and run:

```text
Add trigger
→ Trigger now
```

Use the same parameters:

| Parameter | Value |
|---|---|
| `p_load_date` | `2099-01-01` |
| `p_source_system` | `retail` |

---

## 5. Expected Error Pattern

The exact message may vary, but it should indicate that the source file or path could not be found or read.

Expected diagnostic areas:

```text
AzureDiagnostics
Category = ActivityRuns
pipelineName_s = pl_ingest_retail_files_prdp
activityName_s = copy_entity_to_bronze
status_s != Succeeded
Error_message_s is not empty
```

---

## 6. Evidence

Capture:

```text
ADF failed run
Failed Copy activity detail
Log Analytics failure query
Alert query result
```
