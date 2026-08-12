# Infrastructure

This folder contains the Bicep baseline for `production-ready-azure-data-pipeline`.

## Files

```text
infra/
├── main.bicep
├── parameters.dev.json
└── README.md
```

## MVP Strategy

The MVP starts with a simple single-file Bicep baseline.

Modular Bicep is intentionally deferred as a future improvement.

## Resources Defined

The current Bicep baseline defines:

- ADLS Gen2-enabled Storage Account
- Single container named `datalake`
- Azure Data Factory with System Assigned Managed Identity
- Azure Key Vault using RBAC authorization
- Log Analytics Workspace
- Diagnostic settings from Data Factory to Log Analytics

## Validation

From the repository root:

```powershell
./scripts/validate_bicep.ps1 -ResourceGroupName "rg-prdp-dev"
```

## Deployment

From the repository root:

```powershell
./scripts/deploy_infra.ps1 -ResourceGroupName "rg-prdp-dev" -Location "eastus" -CreateResourceGroup -WhatIf
```

Then deploy intentionally:

```powershell
./scripts/deploy_infra.ps1 -ResourceGroupName "rg-prdp-dev" -Location "eastus" -CreateResourceGroup -Deploy
```

## Notes

Role assignments are not automated in the first baseline.

They should be validated and documented during the security configuration phase.
