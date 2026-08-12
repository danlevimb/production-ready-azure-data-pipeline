param(
    [Parameter(Mandatory = $true)]
    [string]$ResourceGroupName,

    [string]$Location = "eastus",
    [string]$TemplateFile = "infra/main.bicep",
    [string]$ParametersFile = "infra/parameters.dev.json",

    [switch]$CreateResourceGroup,
    [switch]$WhatIf,
    [switch]$Deploy
)

$ErrorActionPreference = "Stop"

if (-not $WhatIf -and -not $Deploy) {
    throw "Choose either -WhatIf or -Deploy. This script will not deploy by accident."
}

if ($CreateResourceGroup) {
    Write-Host "Creating or updating resource group: $ResourceGroupName in $Location" -ForegroundColor Cyan
    az group create --name $ResourceGroupName --location $Location
}

Write-Host "Building Bicep template..." -ForegroundColor Cyan
az bicep build --file $TemplateFile

Write-Host "Validating deployment..." -ForegroundColor Cyan
az deployment group validate `
    --resource-group $ResourceGroupName `
    --template-file $TemplateFile `
    --parameters @$ParametersFile

if ($WhatIf) {
    Write-Host "Running deployment what-if..." -ForegroundColor Cyan
    az deployment group what-if `
        --resource-group $ResourceGroupName `
        --template-file $TemplateFile `
        --parameters @$ParametersFile
}

if ($Deploy) {
    Write-Host "Deploying infrastructure..." -ForegroundColor Yellow
    az deployment group create `
        --resource-group $ResourceGroupName `
        --template-file $TemplateFile `
        --parameters @$ParametersFile
}

Write-Host "Infrastructure script completed." -ForegroundColor Green
