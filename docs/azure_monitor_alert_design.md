# Azure Monitor Alert Design

**Project:** `production-ready-azure-data-pipeline`  
**Phase:** 8 — Failure Diagnostics and Alerting

---

## 1. Purpose

This document defines the alert design for failed ADF pipeline/activity runs.

The MVP alert rule should detect failed execution telemetry from Log Analytics.

---

## 2. Alert Name

```text
alert-prdp-adf-pipeline-failure
```

---

## 3. Signal Source

Use Log Analytics query results from:

```text
AzureDiagnostics
```

---

## 4. Alert Logic

Alert when failed ADF pipeline/activity records are found in the last 15 minutes.

Recommended KQL file:

```text
kql/03_alert_rule_query.kql
```

---

## 5. Evaluation

Recommended MVP configuration:

| Setting | Value |
|---|---|
| Evaluation frequency | 5 minutes |
| Lookback window | 15 minutes |
| Threshold | Greater than 0 |
| Severity | 2 or 3 |

---

## 6. Action Group

For MVP evidence, an action group is optional.

Acceptable options:

1. Create the alert rule without notification action and document the design.
2. Use an existing action group if available.
3. Create a minimal email action group for test notifications.

If an email or personal identifier appears in screenshots, censor it before publishing.

---

## 7. Portal Creation Path

Azure Portal:

```text
Log Analytics Workspace
→ Logs
→ Run kql/03_alert_rule_query.kql
→ New alert rule
```

Then configure:

```text
Measurement: Table rows / number of results
Condition: Greater than 0
Evaluation period: 15 minutes
Frequency: 5 minutes
Severity: 2 or 3
```

---

## 8. Defense Note

The MVP alert demonstrates operational awareness.

It does not claim enterprise incident management completeness.

Future improvements may include:

- Multiple alert rules by failure type
- Dedicated action groups
- Teams/Slack notifications
- PagerDuty integration
- Incident routing
- Suppression windows
- Environment-specific alerts
