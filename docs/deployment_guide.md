# Deployment Guide

**Project:** `production-ready-azure-data-pipeline`

---

## 1. Purpose

This guide explains how to validate and deploy the first Bicep infrastructure baseline.

---

## 2. Prerequisites

Required locally:

- Azure CLI
- Azure CLI Bicep support
- PowerShell
- Azure subscription access
- Permission to create resources in the selected resource group

---

## 3. Login

```powershell
az login
az account show
```

If needed:

```powershell
az account set --subscription "<subscription-name-or-id>"
```

---

## 4. Validate Bicep Locally

```powershell
./scripts/validate_bicep.ps1 -ResourceGroupName "rg-prdp-dev"
```

---

## 5. Run What-If

```powershell
./scripts/deploy_infra.ps1 `
  -ResourceGroupName "rg-prdp-dev" `
  -Location "eastus" `
  -CreateResourceGroup `
  -WhatIf
```

---

## 6. Deploy Intentionally

```powershell
./scripts/deploy_infra.ps1 `
  -ResourceGroupName "rg-prdp-dev" `
  -Location "eastus" `
  -CreateResourceGroup `
  -Deploy
```

---

## 7. Validate in Azure Portal

After deployment, confirm:

- Resource group exists.
- Storage account exists.
- Container `datalake` exists.
- Azure Data Factory exists.
- ADF Managed Identity exists.
- Key Vault exists.
- Log Analytics Workspace exists.
- Data Factory diagnostic settings point to Log Analytics.

---

## 8. Evidence

Capture public-safe screenshots.

Do not expose:

- Subscription IDs
- Tenant IDs
- Object IDs
- Personal emails
- Secrets
- Keys
- SAS tokens
- Connection strings
