# Infrastructure as Code Strategy

**Project:** `production-ready-azure-data-pipeline`  
**Phase:** 1 — Architecture and Scope Definition  
**Status:** MVP decisions confirmed

---

## 1. What Is Bicep?

Bicep is a declarative Infrastructure as Code language for Azure.

In this project, Bicep is used to describe Azure resources in version-controlled files instead of creating everything manually through the Azure Portal.

In simple terms:

```text
Bicep = Azure infrastructure written as code.
```

Example idea:

```text
I need a storage account.
I need an Azure Data Factory.
I need a Key Vault.
I need a Log Analytics workspace.
```

Bicep expresses that desired infrastructure in files that can be reviewed, validated, committed, and deployed.

---

## 2. Confirmed MVP Strategy

The MVP uses:

```text
Simple single-file Bicep baseline first.
```

A modular Bicep structure is deferred as a future improvement.

---

## 3. Candidate Resources

Candidate Bicep-managed resources:

- Storage account
- ADLS Gen2 container named `datalake`
- Azure Data Factory
- Azure Key Vault
- Log Analytics workspace
- Application Insights, only if needed
- Action group or alert rule, if included in MVP
- Role assignment examples, if feasible

Some role assignments may require extra care and may be documented if not fully automated.

---

## 4. Confirmed Infra Folder

```text
infra/
├── main.bicep
├── parameters.dev.json
└── README.md
```

Future modular structure:

```text
infra/
├── modules/
│   ├── storage.bicep
│   ├── datafactory.bicep
│   ├── keyvault.bicep
│   └── monitoring.bicep
├── main.bicep
└── parameters.dev.json
```
