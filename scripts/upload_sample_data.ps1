<#
.SYNOPSIS
Uploads sample retail CSV files to ADLS Gen2 for the production-ready Azure data pipeline.

.DESCRIPTION
Uploads local sample CSV files into the ADLS Gen2 filesystem/container created by the IaC baseline.
Default valid target path:
  datalake/landing/retail/load_date=2026-08-12/
Optional invalid-data target path:
  datalake/landing/retail_validation_failure/load_date=2026-08-12/
The script uses Azure CLI with --auth-mode login. No storage keys or SAS tokens are required.
#>
param(
    [string]$StorageAccountName = "stprdpdevgeq2n4khizfxo",
    [string]$FileSystemName = "datalake",
    [string]$LoadDate = "2026-08-12",
    [ValidateSet("valid", "invalid", "all")]
    [string]$Scenario = "valid"
)
$ErrorActionPreference = "Stop"
function Write-Step { param([string]$Message); Write-Host ""; Write-Host "==> $Message" -ForegroundColor Cyan }
function Assert-CommandSucceeded { param([int]$ExitCode,[string]$FailureMessage); if ($ExitCode -ne 0) { throw $FailureMessage } }
$RepoRoot = Resolve-Path (Join-Path $PSScriptRoot "..")
$IncomingPath = Join-Path $RepoRoot "sample-data\incoming"
$InvalidPath = Join-Path $RepoRoot "sample-data\invalid"
Write-Step "Checking Azure CLI login"
az account show --output none
Assert-CommandSucceeded $LASTEXITCODE "Azure CLI is not logged in. Run: az login"
Write-Step "Checking ADLS Gen2 filesystem/container: $FileSystemName"
az storage fs show --account-name $StorageAccountName --name $FileSystemName --auth-mode login --output none
Assert-CommandSucceeded $LASTEXITCODE "Could not access filesystem/container '$FileSystemName'. Check RBAC permissions and storage account name."
function New-AdlsDirectoryIfNeeded { param([string]$DirectoryPath)
    Write-Step "Ensuring ADLS directory exists: $DirectoryPath"
    az storage fs directory create --account-name $StorageAccountName --file-system $FileSystemName --name $DirectoryPath --auth-mode login --only-show-errors --output none
    Assert-CommandSucceeded $LASTEXITCODE "Failed to create or verify ADLS directory: $DirectoryPath"
}
function Upload-AdlsFile { param([string]$SourcePath,[string]$TargetDirectory)
    if (-not (Test-Path $SourcePath)) { throw "Source file not found: $SourcePath" }
    $FileName = Split-Path $SourcePath -Leaf
    $TargetPath = "$TargetDirectory/$FileName"
    Write-Host "Uploading $FileName -> $FileSystemName/$TargetPath"
    az storage fs file upload --account-name $StorageAccountName --file-system $FileSystemName --source $SourcePath --path $TargetPath --auth-mode login --overwrite true --only-show-errors --output none
    Assert-CommandSucceeded $LASTEXITCODE "Failed to upload file: $SourcePath"
}
$ValidTargetDirectory = "landing/retail/load_date=$LoadDate"
$InvalidTargetDirectory = "landing/retail_validation_failure/load_date=$LoadDate"
if ($Scenario -eq "valid" -or $Scenario -eq "all") {
    New-AdlsDirectoryIfNeeded -DirectoryPath $ValidTargetDirectory
    foreach ($File in @("orders_20260812.csv", "payments_20260812.csv", "order_items_20260812.csv")) {
        Upload-AdlsFile -SourcePath (Join-Path $IncomingPath $File) -TargetDirectory $ValidTargetDirectory
    }
}
if ($Scenario -eq "invalid" -or $Scenario -eq "all") {
    New-AdlsDirectoryIfNeeded -DirectoryPath $InvalidTargetDirectory
    Upload-AdlsFile -SourcePath (Join-Path $InvalidPath "orders_invalid_20260812.csv") -TargetDirectory $InvalidTargetDirectory
}
Write-Step "Listing uploaded files"
if ($Scenario -eq "valid" -or $Scenario -eq "all") {
    Write-Host ""; Write-Host "Valid scenario files:" -ForegroundColor Green
    az storage fs file list --account-name $StorageAccountName --file-system $FileSystemName --path $ValidTargetDirectory --auth-mode login --output table
}
if ($Scenario -eq "invalid" -or $Scenario -eq "all") {
    Write-Host ""; Write-Host "Invalid scenario files:" -ForegroundColor Yellow
    az storage fs file list --account-name $StorageAccountName --file-system $FileSystemName --path $InvalidTargetDirectory --auth-mode login --output table
}
Write-Step "Sample upload completed"
Write-Host "Scenario: $Scenario"
Write-Host "Storage account: $StorageAccountName"
Write-Host "Filesystem/container: $FileSystemName"
Write-Host "Load date: $LoadDate"
