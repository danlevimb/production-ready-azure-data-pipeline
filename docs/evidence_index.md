# Evidence Index

**Project:** `production-ready-azure-data-pipeline`  
**Status:** Current public evidence index

---

## 1. Purpose

This document indexes the public-safe evidence that is actually versioned in the repository.

Evidence supports the project's engineering claims; it does not replace the implementation or technical documentation.

## 2. Published evidence

### Sample data / landing validation

| File | What it proves |
|---|---|
| [`sample_data_upload.png`](../evidence/01_resource_setup/sample_data_upload.png) | Scripted sample-data upload was executed |
| [`sample_data_upload_validation.png`](../evidence/01_resource_setup/sample_data_upload_validation.png) | Uploaded landing data was validated |

### Monitoring / observability

| File | What it proves |
|---|---|
| [`01_adf_categories_detected.png`](../evidence/05_monitoring/01_adf_categories_detected.png) | ADF diagnostic categories are available in Log Analytics |
| [`02_pipeline_runs_query.png`](../evidence/05_monitoring/02_pipeline_runs_query.png) | Pipeline-run telemetry can be queried |
| [`03_activity_runs_query.png`](../evidence/05_monitoring/03_activity_runs_query.png) | Activity-level telemetry can be queried |
| [`04_copy_activity_metrics.png`](../evidence/05_monitoring/04_copy_activity_metrics.png) | Copy activity metrics are observable |
| [`05_run_summary.png`](../evidence/05_monitoring/05_run_summary.png) | Run-level operational summary is available |

### Controlled failure and alerting

| File | What it proves |
|---|---|
| [`00_failure_detector.png`](../evidence/06_failure_alerting/00_failure_detector.png) | Failed execution records are detectable |
| [`01_failure_details.png`](../evidence/06_failure_alerting/01_failure_details.png) | Failure details and error context are queryable |
| [`02_latest_pipeline_status.png`](../evidence/06_failure_alerting/02_latest_pipeline_status.png) | Recent successful and failed pipeline states are visible |
| [`03_alert_rule_query.png`](../evidence/06_failure_alerting/03_alert_rule_query.png) | KQL alert condition detects failures |
| [`04_failure_evidence_query.png`](../evidence/06_failure_alerting/04_failure_evidence_query.png) | Compact failure evidence can be produced for investigation |
| [`05_post_alert_validation.png`](../evidence/06_failure_alerting/05_post_alert_validation.png) | Failure condition remained observable after alert configuration |
| [`06_alert_rule_condition.png`](../evidence/06_failure_alerting/06_alert_rule_condition.png) | Azure Monitor alert condition was configured |
| [`07_alert_rule_details.png`](../evidence/06_failure_alerting/07_alert_rule_details.png) | Alert-rule configuration exists |
| [`08_alert_rule_created.png`](../evidence/06_failure_alerting/08_alert_rule_created.png) | Azure Monitor alert rule was created |
| [`09_sms_alert_received.png`](../evidence/06_failure_alerting/09_sms_alert_received.png) | Action Group SMS notification was received |
| [`10_email_alert_received.pdf`](../evidence/06_failure_alerting/10_email_alert_received.pdf) | Action Group email notification was received |

## 3. Evidence claim boundary

The current public evidence supports claims that the project implemented:

- scripted landing-data upload and validation;
- ADF operational telemetry in Log Analytics;
- KQL monitoring and diagnostics;
- controlled failure detection;
- Azure Monitor log-search alerting;
- Action Group notification.

The repository also contains implementation artifacts for Bicep, ADF, Managed Identity / Key Vault strategy, CI validation, scripts, and KQL. Those artifacts should be used as implementation evidence rather than inventing screenshots that were never captured.

## 4. Public-safety rules

Every public artifact should avoid exposing:

- Subscription IDs
- Tenant IDs
- Object IDs / Principal IDs
- personal email addresses
- unnecessary phone numbers
- secrets
- storage account keys
- SAS tokens
- connection strings
- client secrets
- sensitive portal URLs

## 5. Evidence discipline

Evidence should:

1. prove a specific README or documentation claim;
2. preserve enough Azure context to remain technically meaningful;
3. avoid duplicate screenshots;
4. distinguish implementation artifacts from portal evidence;
5. preserve honest scope boundaries.

The strongest end-to-end proof chain in this repository is:

```text
Controlled pipeline failure
        ↓
AzureDiagnostics telemetry
        ↓
KQL diagnosis
        ↓
Azure Monitor alert
        ↓
Action Group notification
```
