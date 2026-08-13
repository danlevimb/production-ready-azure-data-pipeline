<#
.SYNOPSIS
Validates that sample files exist in the ADLS Gen2 landing path.
#>
param(
    [string]$StorageAccountName = "stprdpdevgeq2n4khizfxo",
    [string]$FileSystemName = "datalake",
    [string]$LoadDate = "2026-08-12",
    [ValidateSet("valid", "invalid")]
    [string]$Scenario = "valid"
)
$ErrorActionPreference = "Stop"
if ($Scenario -eq "valid") { $TargetDirectory = "landing/retail/load_date=$LoadDate" } else { $TargetDirectory = "landing/retail_validation_failure/load_date=$LoadDate" }
Write-Host "Validating ADLS files at: $FileSystemName/$TargetDirectory" -ForegroundColor Cyan
az storage fs file list --account-name $StorageAccountName --file-system $FileSystemName --path $TargetDirectory --auth-mode login --output table
if ($LASTEXITCODE -ne 0) { throw "Failed to list files. Check storage account, filesystem, path, and RBAC permissions." }
