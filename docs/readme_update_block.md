# README Update Block

Use this section to update the project README after Phase 9.

---

## Production-Ready Capabilities Demonstrated

This project demonstrates a small but production-oriented Azure Data Engineering pipeline.

Implemented capabilities:

- Azure Data Factory orchestration
- ADLS Gen2 landing and bronze zones
- Scripted sample data upload
- Parameterized ADF dataset
- Parameterized ADF pipeline
- `run_id`-based output traceability
- Managed Identity authentication
- Azure Key Vault linked service
- Secure ADLS linked service
- Bicep Infrastructure as Code baseline
- GitHub Actions Bicep validation
- Log Analytics monitoring queries
- Controlled failure diagnostics
- Azure Monitor log search alert
- Action Group notification by SMS/email
- Public-safe evidence documentation

---

## Operational Flow

```text
Sample CSV files
    ↓
Scripted upload to ADLS landing
    ↓
ADF pipeline
    ↓
Bronze output with run_id
    ↓
AzureDiagnostics logs
    ↓
Log Analytics KQL queries
    ↓
Azure Monitor alert rule
    ↓
Action Group SMS/email notification
```

---

## Alerting

The project includes a log search alert rule:

```text
alert-prdp-adf-pipeline-failure
```

The alert detects failed pipeline or activity records for:

```text
pl_ingest_retail_files_prdp
```

using `AzureDiagnostics` logs.

The alert condition is:

```text
Count of failed records > 0
```

A controlled failure was executed and the alert was confirmed through SMS and email notification.
