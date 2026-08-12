# Phase 3 — Infrastructure as Code Baseline

**Project:** `production-ready-azure-data-pipeline`  
**Status:** Ready for validation  
**IaC tool:** Bicep  
**Deployment scope:** Resource group

---

## 1. Purpose

This phase introduces the first Infrastructure as Code baseline for the project.

The goal is to define the core Azure resources in version-controlled Bicep files instead of relying only on portal clicks.

---

## 2. Baseline Resources

The first Bicep baseline defines:

- ADLS Gen2-enabled Storage Account
- Single container named `datalake`
- Azure Data Factory with System Assigned Managed Identity
- Azure Key Vault with RBAC authorization
- Log Analytics Workspace
- Diagnostic settings from Data Factory to Log Analytics

---

## 3. Confirmed MVP IaC Decisions

| Decision | Status |
|---|---|
| Use Bicep | Confirmed |
| Start with simple single-file Bicep | Confirmed |
| Defer modular Bicep | Confirmed as future improvement |
| Use GitHub Actions for Bicep validation first | Confirmed |
| Avoid automated deployment until validation is understood | Confirmed |

---

## 4. Files Added

```text
infra/main.bicep
infra/parameters.dev.json
infra/README.md
scripts/validate_bicep.ps1
scripts/deploy_infra.ps1
.github/workflows/bicep-validation.yml
docs/bicep_quick_guide.md
docs/resource_naming.md
docs/deployment_guide.md
```

---

## 5. Validation Flow

Local validation:

```powershell
./scripts/validate_bicep.ps1 -ResourceGroupName "rg-prdp-dev"
```

GitHub validation:

```text
Push changes to GitHub → GitHub Actions → az bicep build
```

---

## 6. Deployment Flow

First run a what-if:

```powershell
./scripts/deploy_infra.ps1 -ResourceGroupName "rg-prdp-dev" -Location "eastus" -CreateResourceGroup -WhatIf
```

Then deploy intentionally:

```powershell
./scripts/deploy_infra.ps1 -ResourceGroupName "rg-prdp-dev" -Location "eastus" -CreateResourceGroup -Deploy
```

---

## 7. Evidence to Capture

Suggested evidence:

```text
evidence/01_resource_setup/01_bicep_validation_success.png
evidence/01_resource_setup/02_github_actions_bicep_build_success.png
evidence/01_resource_setup/03_resource_group_created.png
evidence/01_resource_setup/04_core_resources_deployed.png
```

---

## 8. Completion Criteria

Phase 3 is complete when:

1. `infra/main.bicep` is committed.
2. `infra/parameters.dev.json` is committed.
3. Bicep syntax build succeeds.
4. Deployment validation succeeds.
5. GitHub Actions Bicep validation succeeds.
6. Resource deployment succeeds or is intentionally deferred after what-if.
7. Evidence is captured.
