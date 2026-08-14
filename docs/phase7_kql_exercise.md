# Phase 7 KQL Exercise

**Project:** `production-ready-azure-data-pipeline`  
**Phase:** 7 — Monitoring and Observability

---

## 1. Exercise Goal

Use KQL to observe the ADF pipeline through Log Analytics.

This exercise is based on the exported Log Analytics schema, which contains `AzureDiagnostics`-style columns.

---

## 2. KQL Mental Model

KQL reads like a pipeline:

```kusto
Table
| filter rows
| shape columns
| aggregate results
| sort output
```

Example:

```kusto
AzureDiagnostics
| where TimeGenerated > ago(24h)
| where pipelineName_s == "pl_ingest_retail_files_prdp"
| project TimeGenerated, pipelineName_s, status_s
```

Think of each `|` as:

```text
and then...
```

---

## 3. Exercise Steps

### Step 1 — Detect ADF categories

Run:

```text
kql/00_detect_adf_categories.kql
```

Expected:

```text
ADF-related categories appear.
```

### Step 2 — Query pipeline runs

Run:

```text
kql/01_pipeline_runs.kql
```

Expected:

```text
pl_ingest_retail_files_prdp appears with a status.
```

### Step 3 — Query activity runs

Run:

```text
kql/02_activity_runs.kql
```

Expected:

```text
set_entity_list
foreach_entity
copy_entity_to_bronze
```

### Step 4 — Inspect copy metrics

Run:

```text
kql/03_copy_activity_metrics.kql
```

Expected:

```text
copy_entity_to_bronze appears multiple times.
Files written / data written metrics are visible when available.
```

### Step 5 — Build run summary

Run:

```text
kql/04_run_summary.kql
```

Expected:

```text
One row per pipeline run with activity counts and copy metrics.
```

### Step 6 — Failure diagnostics

Run:

```text
kql/05_failure_diagnostics.kql
```

Expected happy-path result:

```text
No failure rows.
```

### Step 7 — Evidence query

Run:

```text
kql/06_evidence_query.kql
```

Use this for a compact portfolio screenshot.

---

## 4. Completion Criteria

This exercise is complete when:

1. You identify the ADF log categories.
2. You query pipeline-level telemetry.
3. You query activity-level telemetry.
4. You inspect copy metrics.
5. You produce a run summary.
6. You capture public-safe evidence.
