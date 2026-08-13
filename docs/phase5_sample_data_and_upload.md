# Phase 5 — Sample Data and Scripted Upload

**Project:** `production-ready-azure-data-pipeline`  
**Phase:** 5 — Sample Data and Scripted Upload  
**Status:** Ready to execute

---

## 1. Objective

Create small retail/order-processing CSV files and upload them to ADLS Gen2 through a repeatable PowerShell script.

The goal is to avoid manual portal uploads and preserve a reproducible ingestion setup.

---

## 2. Files Included

Valid sample files:

```text
sample-data/incoming/orders_20260812.csv
sample-data/incoming/payments_20260812.csv
sample-data/incoming/order_items_20260812.csv
```

Controlled invalid sample file:

```text
sample-data/invalid/orders_invalid_20260812.csv
```

Scripts:

```text
scripts/upload_sample_data.ps1
scripts/validate_landing_files.ps1
```

---

## 3. Target ADLS Paths

Valid files are uploaded to:

```text
datalake/landing/retail/load_date=2026-08-12/
```

Invalid test data is uploaded to:

```text
datalake/landing/retail_validation_failure/load_date=2026-08-12/
```

---

## 4. Upload Valid Files

From the repository root:

```powershell
./scripts/upload_sample_data.ps1 `
  -StorageAccountName "stprdpdevgeq2n4khizfxo" `
  -FileSystemName "datalake" `
  -LoadDate "2026-08-12" `
  -Scenario "valid"
```

---

## 5. Upload Invalid Test File

Use this only when testing validation/failure behavior:

```powershell
./scripts/upload_sample_data.ps1 `
  -StorageAccountName "stprdpdevgeq2n4khizfxo" `
  -FileSystemName "datalake" `
  -LoadDate "2026-08-12" `
  -Scenario "invalid"
```

---

## 6. Validate Uploaded Files

```powershell
./scripts/validate_landing_files.ps1 `
  -StorageAccountName "stprdpdevgeq2n4khizfxo" `
  -FileSystemName "datalake" `
  -LoadDate "2026-08-12" `
  -Scenario "valid"
```

---

## 7. Security Note

The scripts use:

```text
--auth-mode login
```

This means Azure CLI uses the signed-in Microsoft Entra identity. No storage keys, SAS tokens, passwords, or connection strings are required.

If the script fails with `AuthorizationPermissionMismatch` or `Forbidden`, assign your signed-in user a data-plane role such as `Storage Blob Data Contributor` on the storage account or the `datalake` container.

---

## 8. Evidence to Capture

Recommended screenshots:

```text
03_pipeline_execution/01_sample_data_files_in_repo.png
03_pipeline_execution/02_upload_script_success.png
03_pipeline_execution/03_adls_landing_files_uploaded.png
```

Censor subscription ID, tenant ID, object ID, personal emails, and any sensitive values before publishing evidence.

---

## 9. Completion Criteria

Phase 5 is complete when:

1. Valid CSV files exist in `sample-data/incoming/`.
2. Invalid test CSV exists in `sample-data/invalid/`.
3. Upload script runs successfully.
4. ADLS landing path contains the uploaded files.
5. Validation script lists the uploaded files.
6. Evidence is captured safely.
