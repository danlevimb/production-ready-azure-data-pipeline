# Architecture and Scope

**Project:** `production-ready-azure-data-pipeline`  
**Phase:** 1 — Architecture and Scope Definition  
**Status:** MVP decisions confirmed / ready for Phase 1 approval

---

## 1. Project Mission

Build a small Azure data pipeline that demonstrates production-readiness patterns.

The project should show that a data pipeline can be:

- Secure
- Observable
- Deployable
- Maintainable
- Auditable
- Cost-aware
- Operationally defensible

This project intentionally focuses on operational maturity rather than complex transformations or large data volume.

---

## 2. Professional Question

```text
Can I move beyond a working data pipeline and make it secure, observable, deployable, maintainable, and operationally defensible?
```

---

## 3. Confirmed Approach

The selected approach is hybrid:

```text
Create a small fresh pipeline inspired by the retail/order-processing themes used in previous portfolio projects.
```

This avoids modifying already closed public repositories while preserving continuity across the portfolio.

---

## 4. MVP Scope

The MVP includes:

- Azure Data Factory as orchestrator
- ADLS Gen2 as data lake storage
- One ADLS container named `datalake`
- Azure Key Vault for secret management
- Managed Identity for service-to-service authentication
- Azure Monitor / Log Analytics for operational visibility
- GitHub Actions for Bicep validation
- Bicep for Infrastructure as Code
- Small retail/order-processing CSV sample data
- Scripted sample file upload
- Operational logging and run correlation
- Controlled validation behavior
- Rejected output path
- Failure handling
- Alerting strategy
- Evidence-backed public documentation

---

## 5. Out of Scope

The MVP intentionally excludes:

- Databricks
- Synapse Serverless SQL
- Dedicated SQL Pool
- Spark Pool
- Power BI
- Microsoft Purview
- Private Endpoints
- Full network isolation
- Enterprise RBAC matrix
- Full multi-environment deployment
- Large production-scale datasets
- Real-time streaming
- Advanced data modeling
- Modular Bicep structure as a required MVP feature
- Full GitHub Actions deployment automation as a required MVP feature

These items may appear as future improvements, but they are not required for the MVP.

---

## 6. Logical Architecture

```text
Sample CSV source files
        ↓
Scripted upload
        ↓
ADLS Gen2 datalake/landing
        ↓
Azure Data Factory pipeline
        ↓
Validation / metadata logging
        ↓
ADLS Gen2 datalake/bronze
        ↓
ADLS Gen2 datalake/rejected
        ↓
ADLS Gen2 datalake/audit
        ↓
Azure Monitor / Log Analytics
        ↓
Alerts / operational review
```

Deployment and configuration layer:

```text
GitHub repository
        ↓
GitHub Actions
        ↓
Bicep validation
        ↓
Manual or documented deployment
        ↓
Azure resources
```

Security layer:

```text
Managed Identity
        ↓
Azure Key Vault
        ↓
Secret-free linked services / secure configuration
```

---

## 7. MVP Success Criteria

The MVP is successful when:

1. Azure resources are defined through a simple Bicep baseline.
2. Secrets are not committed to GitHub.
3. ADF uses Managed Identity and/or Key Vault-backed configuration.
4. Sample files can be uploaded through a script.
5. The pipeline ingests small sample files into ADLS Gen2.
6. Pipeline execution is traceable by run ID.
7. Success and failure paths are logged.
8. Bad rows or invalid data can be sent to `rejected/`.
9. Monitoring data is available in Log Analytics or Azure Monitor.
10. At least one alert scenario is defined and documented.
11. GitHub Actions validates Bicep.
12. Evidence is captured and public-safe.
13. Known limitations are documented honestly.
