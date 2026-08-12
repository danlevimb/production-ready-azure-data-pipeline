# Bicep Quick Guide

**Project:** `production-ready-azure-data-pipeline`

---

## 1. What Is Bicep?

Bicep is a declarative Infrastructure as Code language for Azure.

In this project, Bicep is used to define Azure resources in code.

Simple mental model:

```text
Bicep = Azure infrastructure written as code
```

---

## 2. What Bicep Does

Bicep defines resources such as:

- Storage accounts
- ADLS containers
- Azure Data Factory
- Azure Key Vault
- Log Analytics Workspace
- Diagnostic settings

---

## 3. What Bicep Does Not Do

Bicep does not:

- Transform data
- Replace Azure Data Factory
- Run ETL logic
- Validate business data
- Replace monitoring queries
- Replace operational runbooks

---

## 4. Why It Matters Professionally

Without Bicep:

```text
I clicked around in the Azure Portal and created resources manually.
```

With Bicep:

```text
My Azure infrastructure is version-controlled, reviewable, repeatable, and validated before deployment.
```

---

## 5. First Commands

Build the Bicep file:

```powershell
az bicep build --file infra/main.bicep
```

Validate against a resource group:

```powershell
az deployment group validate `
  --resource-group rg-prdp-dev `
  --template-file infra/main.bicep `
  --parameters @infra/parameters.dev.json
```

Run what-if:

```powershell
az deployment group what-if `
  --resource-group rg-prdp-dev `
  --template-file infra/main.bicep `
  --parameters @infra/parameters.dev.json
```

Deploy:

```powershell
az deployment group create `
  --resource-group rg-prdp-dev `
  --template-file infra/main.bicep `
  --parameters @infra/parameters.dev.json
```
