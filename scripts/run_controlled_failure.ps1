<#
.SYNOPSIS
Runs the ADF pipeline with a controlled failure load date.

.DESCRIPTION
This script starts a published ADF pipeline run using a load_date that is expected not to exist.
The purpose is to generate failure telemetry for Log Analytics and alert-rule testing.

NOTE:
If this command syntax differs in your installed Azure CLI extension version,
use ADF Studio Debug or Trigger Now with p_load_date = 2099-01-01.
#>

param(
    [string]$ResourceGroupName = "rg-prdp-dev",
    [string]$DataFactoryName = "adf-prdp-dev-geq2n4",
    [string]$PipelineName = "pl_ingest_retail_files_prdp",
    [string]$LoadDate = "2099-01-01",
    [string]$SourceSystem = "retail"
)

$ErrorActionPreference = "Stop"

Write-Host "Starting controlled failure pipeline run..." -ForegroundColor Cyan
Write-Host "Resource group: $ResourceGroupName"
Write-Host "Data Factory: $DataFactoryName"
Write-Host "Pipeline: $PipelineName"
Write-Host "Load date: $LoadDate"
Write-Host "Source system: $SourceSystem"

$parameters = @{
    p_load_date = $LoadDate
    p_source_system = $SourceSystem
} | ConvertTo-Json -Compress

az datafactory pipeline create-run `
    --resource-group $ResourceGroupName `
    --factory-name $DataFactoryName `
    --name $PipelineName `
    --parameters $parameters `
    --output json

if ($LASTEXITCODE -ne 0) {
    throw "Failed to start controlled failure run. Use ADF Studio Debug or Trigger Now as fallback."
}

Write-Host "Controlled failure run submitted. Wait a few minutes, then query Log Analytics." -ForegroundColor Yellow
