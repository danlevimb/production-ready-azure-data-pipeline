param(
    [Parameter(Mandatory = $true)]
    [string]$ResourceGroupName,

    [string]$TemplateFile = "infra/main.bicep",
    [string]$ParametersFile = "infra/parameters.dev.json"
)

$ErrorActionPreference = "Stop"

Write-Host "Validating Bicep syntax..." -ForegroundColor Cyan
az bicep build --file $TemplateFile

Write-Host "Validating deployment against resource group: $ResourceGroupName" -ForegroundColor Cyan
az deployment group validate `
    --resource-group $ResourceGroupName `
    --template-file $TemplateFile `
    --parameters @$ParametersFile

Write-Host "Bicep validation completed." -ForegroundColor Green
