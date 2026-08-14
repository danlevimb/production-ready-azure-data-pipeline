# Phase 8 — Failure Diagnostics and Alerting

**Project:** `production-ready-azure-data-pipeline`  
**Phase:** 8 — Failure Diagnostics and Alerting  
**Status:** Ready to execute  
**Monitoring model:** Log Analytics using `AzureDiagnostics`  
**Target pipeline:** `pl_ingest_retail_files_prdp`

---

## 1. Objective

Create a controlled failure scenario and prove that the pipeline failure can be detected through Log Analytics.

This phase moves the project from:

```text
I can see successful runs.
```

to:

```text
I can detect, diagnose, and alert on failed runs.
```

---

## 2. Why This Matters

Production-ready pipelines must not only succeed.

They must also fail loudly, leave diagnostic evidence, and give operators enough information to investigate.

This phase demonstrates:

- Controlled failure testing
- Failure telemetry in Log Analytics
- Failure diagnostics with KQL
- Azure Monitor alert-rule design
- Evidence for operational readiness

---

## 3. Controlled Failure Scenario

The current happy-path input exists at:

```text
datalake/landing/retail/load_date=2026-08-12/
```

To force a controlled failure, run the same pipeline with a load date that does not exist:

```text
2099-01-01
```

Expected source path:

```text
datalake/landing/retail/load_date=2099-01-01/
```

Because that path does not exist, the Copy activity should fail.

---

## 4. Run the Failure Test

In ADF Studio:

```text
Author
→ pl_ingest_retail_files_prdp
→ Debug
```

Use parameters:

| Parameter | Value |
|---|---|
| `p_load_date` | `2099-01-01` |
| `p_source_system` | `retail` |

Expected result:

```text
Pipeline failed
ForEach failed
copy_entity_to_bronze failed
```

Alternative: use `Trigger now` if a published run is preferred for monitoring evidence.

---

## 5. Wait for Logs

After the failure run, wait a few minutes for diagnostic logs to arrive in Log Analytics.

Then run the KQL queries included in this phase.

---

## 6. KQL Files

Run these files in order:

```text
kql/00_failure_detector.kql
kql/01_failure_details.kql
kql/02_latest_pipeline_status.kql
kql/03_alert_rule_query.kql
kql/04_failure_evidence_query.kql
```

---

## 7. Azure Monitor Alert Rule

This phase includes a KQL query that can be used as the basis for an Azure Monitor log alert.

Minimum alert logic:

```text
If failed ADF pipeline/activity logs exist in the last 15 minutes, raise an alert.
```

Recommended alert name:

```text
alert-prdp-adf-pipeline-failure
```

Recommended severity:

```text
Sev 2 or Sev 3 for MVP
```

For portfolio purposes, it is acceptable to document the alert design and capture evidence of the alert query. If you implement the alert rule, capture its configuration safely.

---

## 8. Evidence to Capture

Recommended screenshots:

```text
evidence/06_failure_alerting/
  01_controlled_failure_debug_run.png
  02_failure_detector_query.png
  03_failure_details_query.png
  04_alert_rule_query.png
  05_alert_rule_configuration.png
```

If you create and fire the alert rule, also capture:

```text
06_alert_fired.png
```

Censor:

- Subscription ID
- Tenant ID
- Object ID
- Principal ID
- Personal email
- Any sensitive identifiers

---

## 9. Completion Criteria

Phase 8 is complete when:

1. A controlled failure run is executed.
2. The failed run appears in Log Analytics.
3. Failure detail is visible in KQL.
4. An alert-rule query is validated.
5. Alert design is documented.
6. Optional: Azure Monitor alert rule is created.
7. Public-safe evidence is captured.

---

## 10. Interview Defense

A strong explanation:

```text
I tested the pipeline with a controlled failure scenario by running it against a non-existent load date. The failed execution was captured in Log Analytics through AzureDiagnostics. I used KQL to identify failed pipeline and activity records, extract the error message, and design an Azure Monitor log alert that detects failed runs within a defined time window.
```
