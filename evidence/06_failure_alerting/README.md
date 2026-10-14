# Phase 8 Failure and Alerting Evidence

## Published screenshot evidence

| File | What it shows | What it demonstrates |
|---|---|---|
| [`00_failure_detector.png`](00_failure_detector.png) | KQL output identifying failed execution records | Controlled pipeline failures are detectable from centralized telemetry |
| [`01_failure_details.png`](01_failure_details.png) | Failure details and error context returned by the diagnostic query | Operational telemetry contains enough context to investigate the failed execution |
| [`02_latest_pipeline_status.png`](02_latest_pipeline_status.png) | Recent pipeline states including successful and failed runs | Current pipeline health can be evaluated from run-history telemetry |
| [`03_alert_rule_query.png`](03_alert_rule_query.png) | KQL condition used by the Azure Monitor alert | The alert is driven by an explicit, testable failure-detection query |
| [`04_failure_evidence_query.png`](04_failure_evidence_query.png) | Compact KQL result focused on the failed execution | Failure evidence can be reduced to an investigation-friendly operational view |
| [`05_post_alert_validation.png`](05_post_alert_validation.png) | Failure condition still observable after alert configuration | Alert creation did not obscure the underlying diagnostic evidence |
| [`06_alert_rule_condition.png`](06_alert_rule_condition.png) | Azure Monitor alert-condition configuration | The failure query is wired into an operational alert rule |
| [`07_alert_rule_details.png`](07_alert_rule_details.png) | Alert rule configuration and operational settings | The alerting mechanism exists as a configured Azure resource rather than only as a query |
| [`08_alert_rule_created.png`](08_alert_rule_created.png) | Successfully created Azure Monitor alert rule | The failure-detection design was deployed into Azure Monitor |
| [`09_sms_alert_received.png`](09_sms_alert_received.png) | SMS notification delivered by the Action Group | The alerting chain reaches an external notification channel end to end |
| [`10_email_alert_received.pdf`](10_email_alert_received.pdf) | Email notification delivered by the Action Group | The same alerting chain successfully reaches the configured email notification channel |
