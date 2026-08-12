// Production-Ready Azure Data Pipeline
// Phase 3 — Infrastructure as Code Baseline
// Scope: Resource Group deployment
// Purpose: Create the core Azure resources for a production-readiness MVP.

@description('Azure region for all resources. Defaults to the resource group location.')
param location string = resourceGroup().location

@description('Short project code used in resource names. Keep this short for globally constrained names such as storage accounts.')
@minLength(2)
@maxLength(6)
param projectShort string = 'prdp'

@description('Environment code used in resource names and tags.')
@allowed([
  'dev'
  'test'
  'prod'
])
param environmentCode string = 'dev'

@description('Short suffix used for globally unique resource names. Override only if a generated name collides.')
@minLength(3)
@maxLength(8)
param resourceNameSuffix string = take(uniqueString(resourceGroup().id), 6)

@description('Optional additional tags merged with the default project tags.')
param additionalTags object = {}

var normalizedProject = toLower(projectShort)
var normalizedEnvironment = toLower(environmentCode)
var normalizedSuffix = toLower(resourceNameSuffix)

var storageAccountName = take(toLower('st${normalizedProject}${normalizedEnvironment}${uniqueString(resourceGroup().id)}'), 24)
var dataFactoryName = 'adf-${normalizedProject}-${normalizedEnvironment}-${normalizedSuffix}'
var keyVaultName = 'kv-${normalizedProject}-${normalizedEnvironment}-${normalizedSuffix}'
var logAnalyticsWorkspaceName = 'law-${normalizedProject}-${normalizedEnvironment}-${normalizedSuffix}'
var containerName = 'datalake'

var defaultTags = {
  project: 'production-ready-azure-data-pipeline'
  environment: normalizedEnvironment
  managedBy: 'bicep'
  workload: 'portfolio'
}

var tags = union(defaultTags, additionalTags)

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-05-01' = {
  name: storageAccountName
  location: location
  tags: tags
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
    allowBlobPublicAccess: false
    minimumTlsVersion: 'TLS1_2'
    supportsHttpsTrafficOnly: true
    isHnsEnabled: true
  }
}

resource blobService 'Microsoft.Storage/storageAccounts/blobServices@2023-05-01' = {
  parent: storageAccount
  name: 'default'
  properties: {
    deleteRetentionPolicy: {
      enabled: true
      days: 7
    }
    containerDeleteRetentionPolicy: {
      enabled: true
      days: 7
    }
  }
}

resource dataLakeContainer 'Microsoft.Storage/storageAccounts/blobServices/containers@2023-05-01' = {
  parent: blobService
  name: containerName
  properties: {
    publicAccess: 'None'
  }
}

resource dataFactory 'Microsoft.DataFactory/factories@2018-06-01' = {
  name: dataFactoryName
  location: location
  tags: tags
  identity: {
    type: 'SystemAssigned'
  }
  properties: {}
}

resource keyVault 'Microsoft.KeyVault/vaults@2023-07-01' = {
  name: keyVaultName
  location: location
  tags: tags
  properties: {
    tenantId: tenant().tenantId
    sku: {
      family: 'A'
      name: 'standard'
    }
    enableRbacAuthorization: true
    enabledForDeployment: false
    enabledForDiskEncryption: false
    enabledForTemplateDeployment: false
    enableSoftDelete: true
    softDeleteRetentionInDays: 7
    publicNetworkAccess: 'Enabled'
  }
}

resource logAnalyticsWorkspace 'Microsoft.OperationalInsights/workspaces@2022-10-01' = {
  name: logAnalyticsWorkspaceName
  location: location
  tags: tags
  properties: {
    sku: {
      name: 'PerGB2018'
    }
    retentionInDays: 30
    features: {
      enableLogAccessUsingOnlyResourcePermissions: true
    }
  }
}

resource dataFactoryDiagnostics 'Microsoft.Insights/diagnosticSettings@2021-05-01-preview' = {
  name: 'diag-adf-to-log-analytics'
  scope: dataFactory
  properties: {
    workspaceId: logAnalyticsWorkspace.id
    logs: [
      {
        category: 'PipelineRuns'
        enabled: true
      }
      {
        category: 'ActivityRuns'
        enabled: true
      }
      {
        category: 'TriggerRuns'
        enabled: true
      }
    ]
    metrics: [
      {
        category: 'AllMetrics'
        enabled: true
      }
    ]
  }
}

output storageAccountName string = storageAccount.name
output dataLakeContainerName string = dataLakeContainer.name
output dataFactoryName string = dataFactory.name
output dataFactoryPrincipalId string = dataFactory.identity.principalId
output keyVaultName string = keyVault.name
output logAnalyticsWorkspaceName string = logAnalyticsWorkspace.name
output logAnalyticsWorkspaceId string = logAnalyticsWorkspace.id
