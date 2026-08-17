<#
.SYNOPSIS
Optional cleanup notes for the Azure Monitor alert rule and action group.

.DESCRIPTION
This script is intentionally a notes/helper script.
Review before running any delete command.
#>

$rg = "rg-prdp-dev"
$alertRuleName = "alert-prdp-adf-pipeline-failure"
$actionGroupName = "ag-prdp-dev-alerts"

Write-Host "Review alert rule:" -ForegroundColor Cyan
az monitor scheduled-query show `
  --resource-group $rg `
  --name $alertRuleName `
  --output table

Write-Host ""
Write-Host "To delete the alert rule after project closeout, run:" -ForegroundColor Yellow
Write-Host "az monitor scheduled-query delete --resource-group $rg --name $alertRuleName --yes"

Write-Host ""
Write-Host "To review action groups:" -ForegroundColor Cyan
Write-Host "az monitor action-group list --resource-group $rg --output table"

Write-Host ""
Write-Host "To delete the action group after project closeout, run:" -ForegroundColor Yellow
Write-Host "az monitor action-group delete --resource-group $rg --name $actionGroupName"
