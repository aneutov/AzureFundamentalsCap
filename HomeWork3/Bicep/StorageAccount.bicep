  param storageAccountName  string
  param location string
  param docContainerName string
  param pointerContainerName string
  
  resource storageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  location: location
  kind:'BlobStorage'
  properties: {
    accessTier: 'Hot'
  }
  sku: {
    name: 'Standard_LRS'
  }
  name: storageAccountName
  resource blobService 'blobServices' = {
    name: 'default'
    properties: {
      isVersioningEnabled: true
    }
    resource docContainer 'containers' = {
      name: docContainerName
      properties: {
        publicAccess: 'None'
      }
    }
    resource pointerContainer 'containers' = {
      name: pointerContainerName
      properties: {
        publicAccess: 'None'
      }
    }
  }
}
