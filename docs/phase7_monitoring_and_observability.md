# Phase 7 — Monitoring and Observability

**Project:** `production-ready-azure-data-pipeline`  
**Phase:** 7 — Monitoring and Observability  
**Status:** Ready to execute  
**Log Analytics table style:** `AzureDiagnostics`

---

## 1. Objective

Validate that the ADF pipeline leaves operational telemetry in Log Analytics.

The goal is to move from:

```text
The pipeline ran successfully.
```

to:

```text
The pipeline can be observed, queried, diagnosed, and defended operationally.
```

---

## 2. Important Discovery

The Log Analytics schema exported for this project indicates that ADF logs are available through an `AzureDiagnostics`-style schema.

This means the monitoring exercise should query:

```kusto
AzureDiagnostics
```

instead of only relying on resource-specific tables such as:

```kusto
ADFPipelineRun
ADFActivityRun
ADFTriggerRun
```

The schema includes ADF-related columns such as:

```text
Category
pipelineName_s
runId_g
status_s
start_t
end_t
activityName_s
activityType_s
pipelineRunId_g
activityRunId_g
Output_dataRead_d
Output_dataWritten_d
Output_filesRead_d
Output_filesWritten_d
Output_copyDuration_d
Error_errorCode_s
Error_message_s
Error_failureType_s
Error_target_s
Parameters_p_load_date_s
Parameters_p_source_system_s
```

---

## 3. What This Phase Proves

This phase proves that the pipeline has operational visibility.

It should be possible to answer:

- Did the pipeline run?
- Did it succeed or fail?
- Which run ID should be investigated?
- Which activities ran?
- How long did activities take?
- How many files were read or written?
- Was there an error?
- Which pipeline parameters were used?
- Can evidence be captured from Log Analytics?

---

## 4. Target Pipeline

```text
pl_ingest_retail_files_prdp
```

---

## 5. KQL Exercise Sequence

Run the KQL files in this order:

```text
kql/00_detect_adf_categories.kql
kql/01_pipeline_runs.kql
kql/02_activity_runs.kql
kql/03_copy_activity_metrics.kql
kql/04_run_summary.kql
kql/05_failure_diagnostics.kql
kql/06_evidence_query.kql
```

---

## 6. Expected Outcome

Expected monitoring signals:

```text
Pipeline run appears in AzureDiagnostics.
Activity runs appear in AzureDiagnostics.
copy_entity_to_bronze appears at least 3 times.
Status is Succeeded.
RunId or PipelineRunId is visible.
Output metrics are visible for Copy activities.
```

---

## 7. Evidence to Capture

Recommended screenshots:

```text
evidence/05_monitoring/
  01_adf_categories_detected.png
  02_pipeline_run_query_success.png
  03_activity_run_query_success.png
  04_copy_activity_metrics.png
  05_run_summary.png
```

Censor before publishing:

- Subscription ID
- Tenant ID
- Object ID
- Principal ID
- Personal email
- Any sensitive identifiers

---

## 8. Completion Criteria

Phase 7 is complete when:

1. ADF logs are found in Log Analytics.
2. Pipeline runs are queryable.
3. Activity runs are queryable.
4. Copy metrics are visible.
5. A run summary can be produced.
6. Evidence is captured safely.
