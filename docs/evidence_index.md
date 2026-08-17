# Evidence Index

**Project:** `production-ready-azure-data-pipeline`  
**Status:** Draft / update with actual file names

---

## 1. Purpose

This document indexes the public-safe evidence captured for the project.

Evidence should demonstrate that the MVP is functional, secure, observable, alertable, and operationally defensible.

---

## 2. Evidence Naming Standard

Use numbered screenshots and short descriptive names.

Example:

```text
01_resource_group_created.png
02_bicep_validation_succeeded.png
03_adf_pipeline_debug_success.png
```

---

## 3. Resource Setup Evidence

Folder:

```text
evidence/01_resource_setup/
```

Recommended files:

| File | Evidence Purpose | Status |
|---|---|---|
| `01_resource_group_created.png` | Shows `rg-prdp-dev` exists | Pending |
| `02_bicep_validation_succeeded.png` | Shows Bicep validation succeeded | Pending |
| `03_bicep_what_if.png` | Shows planned resources before deployment | Pending |
| `04_deployment_succeeded.png` | Shows deployment completed successfully | Pending |
| `05_resources_created.png` | Shows ADF, Storage, Key Vault, Log Analytics resources | Pending |

---

## 4. Security Evidence

Folder:

```text
evidence/02_security/
```

Recommended files:

| File | Evidence Purpose | Status |
|---|---|---|
| `01_adf_managed_identity_enabled.png` | Shows ADF system-assigned Managed Identity | Pending |
| `02_storage_rbac_assignment.png` | Shows ADF identity has Storage Blob Data Contributor | Pending |
| `03_keyvault_rbac_assignment.png` | Shows ADF identity has Key Vault Secrets User | Pending |
| `04_adls_linked_service_success.png` | Shows ADLS linked service works with Managed Identity | Pending |
| `05_keyvault_linked_service_success.png` | Shows Key Vault linked service works with Managed Identity | Pending |

---

## 5. Pipeline Execution Evidence

Folder:

```text
evidence/03_pipeline_execution/
```

Recommended files:

| File | Evidence Purpose | Status |
|---|---|---|
| `01_sample_upload_success.png` | Shows scripted upload completed | Pending |
| `02_landing_files_uploaded.png` | Shows landing files exist in ADLS | Pending |
| `03_dataset_preview_success.png` | Shows parameterized dataset can preview data | Pending |
| `04_pipeline_canvas.png` | Shows ADF pipeline design | Pending |
| `05_pipeline_debug_success.png` | Shows pipeline succeeded | Pending |
| `06_bronze_orders_file_created.png` | Shows bronze output exists | Pending |
| `07_run_id_traceability.png` | Shows output path includes ADF run ID | Pending |

---

## 6. Monitoring Evidence

Folder:

```text
evidence/05_monitoring/
```

Recommended files:

| File | Evidence Purpose | Status |
|---|---|---|
| `01_adf_categories_detected.png` | Shows `ActivityRuns` and `PipelineRuns` in Log Analytics | Pending |
| `02_pipeline_runs_query.png` | Shows pipeline runs from `AzureDiagnostics` | Pending |
| `03_activity_runs_query.png` | Shows activity-level telemetry | Pending |
| `04_copy_activity_metrics.png` | Shows copy metrics such as files/data written | Pending |
| `05_run_summary.png` | Shows run-level summary query | Pending |

---

## 7. Failure and Alerting Evidence

Folder:

```text
evidence/06_failure_alerting/
```

Recommended files:

| File | Evidence Purpose | Status |
|---|---|---|
| `00_failure_detector.png` | Shows failed records are detectable | Captured |
| `01_failure_details.png` | Shows failure details and error message | Captured |
| `02_latest_pipeline_status.png` | Shows successful and failed runs | Captured |
| `03_alert_rule_query.png` | Shows alert query detects failures | Captured |
| `04_failure_evidence_query.png` | Shows detailed failure evidence | Captured |
| `05_post_alert_validation.png` | Shows post-alert validation count | Captured |
| `06_alert_rule_condition.png` | Shows alert condition configuration | Pending |
| `07_alert_rule_details.png` | Shows alert rule details | Pending |
| `08_alert_rule_created.png` | Shows alert rule was created | Pending |
| `09_sms_alert_received.png` | Shows SMS notification received | Captured |
| `10_email_alert_received.pdf` | Shows email notification received | Captured |

---

## 8. Evidence Notes

The email alert PDF confirms:

- Alert rule name: `alert-prdp-adf-pipeline-failure`
- Severity: `Sev3`
- Monitor condition: `Fired`
- Resource group: `rg-prdp-dev`
- Affected workspace: `law-prdp-dev-geq2n4`
- Monitoring service: `Log Alerts V2`
- Signal type: `Log`
- Query based on `AzureDiagnostics`
- Operator: `GreaterThan`
- Threshold: `0`
- Action group: `prdpalert`

Before publishing the PDF, censor personal email, subscription ID, alert IDs, and full portal URLs.
