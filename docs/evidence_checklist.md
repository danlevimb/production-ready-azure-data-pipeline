# Evidence Checklist

**Project:** `production-ready-azure-data-pipeline`  
**Phase:** 1 — Architecture and Scope Definition  
**Status:** MVP decisions confirmed

---

## 1. Evidence Principles

Evidence should be:

- Public-safe
- Numbered consistently
- Readable
- Focused
- Connected to project claims
- Free of secrets, keys, SAS tokens, connection strings, and personal identifiers

---

## 2. Required Evidence Categories

### 01 — Azure Resource Setup

- Resource group
- Storage account / ADLS Gen2
- Data Factory
- Key Vault
- Log Analytics workspace
- Monitoring resources

### 02 — Security

- Managed Identity enabled
- Key Vault created
- ADF linked service using secure configuration
- IAM assignment evidence, censored where needed
- No secrets in public files

### 03 — Pipeline Execution

- Scripted sample file upload
- Successful pipeline run
- Input source file
- Output in ADLS landing/bronze
- Audit output
- Run ID traceability

### 04 — Failure Handling

- Controlled missing file or bad data scenario
- Pipeline failure or validation failure
- Rejected output or diagnostic log
- Error message captured

### 05 — Monitoring

- ADF Monitor successful run
- ADF Monitor failed run
- Log Analytics query result
- Alert rule configuration
- Alert evidence, if implemented

### 06 — CI/CD

- GitHub Actions workflow file
- Successful workflow run
- Bicep validation result

### 07 — Cost Controls

- No unnecessary always-on compute
- Small sample data
- Deleted or intentionally preserved resources after completion
