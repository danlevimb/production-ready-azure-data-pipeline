# Future Improvements

**Project:** `production-ready-azure-data-pipeline`

---

## 1. Purpose

This document lists future improvements that could make the MVP more production-like.

These are intentionally separated from the implemented MVP scope.

---

## 2. CI/CD Improvements

- Add full deployment through GitHub Actions.
- Use OIDC / federated identity for Azure authentication from GitHub.
- Add pull request validation.
- Add environment approvals.
- Add deployment what-if checks.
- Add automated rollback documentation.

---

## 3. Infrastructure as Code Improvements

- Split Bicep into modules.
- Add environment-specific parameter files.
- Automate role assignments more fully.
- Add policy-as-code.
- Add private endpoints.
- Add diagnostic settings for all critical resources.

---

## 4. Security Improvements

- Add Private Endpoints.
- Add network restrictions.
- Add managed virtual network integration where appropriate.
- Add customer-managed keys if required.
- Add formal least-privilege RBAC matrix.
- Add secret rotation procedure.

---

## 5. Data Quality Improvements

- Add file existence checks before copy.
- Add row-count validation.
- Add schema validation.
- Add domain validation for statuses.
- Add rejected-record routing.
- Add audit file generation.
- Add validation summary outputs to ADLS.

---

## 6. Monitoring Improvements

- Add additional KQL queries for trend analysis.
- Add dashboard/workbook for pipeline health.
- Add latency and duration thresholds.
- Add separate alerts for missing files, pipeline failures, and long-running jobs.
- Add action groups for email, SMS, Teams, or webhook depending on operational model.

---

## 7. Alerting Improvements

- Tune frequency and lookback window by criticality.
- Add severity mapping by pipeline type.
- Add alert auto-resolution when applicable.
- Add notification routing by environment.
- Add runbook links to alert descriptions.
- Add escalation policy.

---

## 8. Operational Runbook Improvements

- Add a formal troubleshooting runbook.
- Add step-by-step failure investigation procedures.
- Add replay/retry procedure.
- Add cleanup procedure.
- Add incident response notes.

---

## 9. Governance Improvements

- Add Microsoft Purview in a future governance project.
- Add lineage documentation.
- Add data owner metadata.
- Add classification and sensitivity labels.

---

## 10. Cost Improvements

- Track cost impact of Log Analytics retention.
- Review alert pricing before leaving rules enabled long-term.
- Add cleanup scripts.
- Add cost dashboard or cost-control documentation.
