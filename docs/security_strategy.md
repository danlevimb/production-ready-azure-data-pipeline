# Security Strategy

**Project:** `production-ready-azure-data-pipeline`  
**Phase:** 1 — Architecture and Scope Definition  
**Status:** MVP decisions confirmed

---

## 1. Core Security Principles

The project follows these principles:

- No secrets committed to GitHub.
- Use Managed Identity where possible.
- Store sensitive values in Azure Key Vault when needed.
- Avoid storage account keys in code.
- Avoid hardcoded connection strings.
- Use least-privilege access where practical.
- Document security limitations honestly.

---

## 2. Managed Identity

Azure Data Factory should use a system-assigned Managed Identity.

Candidate permissions:

| Target | Role / Permission | Purpose |
|---|---|---|
| ADLS Gen2 | Storage Blob Data Contributor | Read/write pipeline files |
| Key Vault | Key Vault Secrets User or equivalent access policy | Read required secrets |
| Log Analytics / Monitor | As needed | Monitoring integration |

Final role assignments should be validated during implementation.

---

## 3. Azure Key Vault

Azure Key Vault should store secrets or sensitive configuration when needed.

The project should avoid using Key Vault just as decoration. If a value is not secret, it should be documented as configuration, not forced into Key Vault.

---

## 4. Secret-Free Repository

The public GitHub repository should not contain:

- Storage account keys
- SAS tokens
- Connection strings
- Passwords
- Client secrets
- Tenant IDs if not necessary
- Subscription IDs if not necessary
- Personal emails
- Screenshots exposing sensitive values
