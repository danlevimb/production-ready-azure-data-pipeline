# Project Closeout Checklist

**Project:** `production-ready-azure-data-pipeline`

---

## 1. Repository QA

- [ ] `git status` is clean.
- [ ] README reflects the implemented MVP.
- [ ] All documentation links work.
- [ ] Evidence files are referenced in `docs/evidence_index.md`.
- [ ] No secrets are committed.
- [ ] No raw subscription IDs are exposed in public evidence.
- [ ] No personal email or phone number is visible in public screenshots.

---

## 2. Technical QA

- [ ] Bicep validation succeeds.
- [ ] Resource deployment succeeds.
- [ ] Storage account exists.
- [ ] `datalake` container exists.
- [ ] ADF exists.
- [ ] Key Vault exists.
- [ ] Log Analytics workspace exists.
- [ ] ADF Managed Identity exists.
- [ ] RBAC assignments are validated.
- [ ] Linked services test successfully.
- [ ] Sample upload script succeeds.
- [ ] ADF pipeline succeeds for valid load date.
- [ ] Bronze output includes `run_id` traceability.
- [ ] Controlled failure is executed.
- [ ] Failure is visible in Log Analytics.
- [ ] Alert rule fires.
- [ ] Action Group notification is received.

---

## 3. Documentation QA

- [ ] Architecture and scope are documented.
- [ ] Security strategy is documented.
- [ ] Monitoring and observability are documented.
- [ ] Failure diagnostics and alerting are documented.
- [ ] Known limitations are documented.
- [ ] Future improvements are documented.
- [ ] Cost controls are documented.
- [ ] Evidence index is complete.

---

## 4. Cost and Cleanup QA

- [ ] Decide whether alert rule remains enabled.
- [ ] Decide whether action group remains enabled.
- [ ] Decide whether Azure resources remain active for future reference.
- [ ] Document any resources intentionally preserved.
- [ ] Delete resources if no longer needed.

---

## 5. Final Portfolio Statement

Suggested portfolio statement:

```text
Built a production-ready Azure Data Factory pipeline MVP using ADLS Gen2, Managed Identity, Key Vault, Bicep, GitHub Actions validation, Log Analytics, Azure Monitor alerts, and Action Group notifications. The project demonstrates secure configuration, reproducible infrastructure, scripted data upload, pipeline traceability, operational observability, controlled failure diagnostics, and alert-based notification.
```
