# Cleanup / Disable Alert Rule Notes
# This is a notes file, not an automatic cleanup script.
# Do not run destructive commands until the closeout decision is confirmed.

# Disable alert rule
az monitor scheduled-query update `
  --resource-group "rg-prdp-dev" `
  --name "alert-prdp-adf-pipeline-failure" `
  --enabled false

# Delete alert rule
az monitor scheduled-query delete `
  --resource-group "rg-prdp-dev" `
  --name "alert-prdp-adf-pipeline-failure"

# List scheduled query rules
az monitor scheduled-query list `
  --resource-group "rg-prdp-dev" `
  --output table

# List action groups
az monitor action-group list `
  --resource-group "rg-prdp-dev" `
  --output table
