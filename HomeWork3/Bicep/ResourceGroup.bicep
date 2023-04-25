targetScope = 'subscription'

param location string
var resourceGroupName = 'aneutov-idh-rs'
var stoAccountName = 'aneutovidhstorage'
var docContainerName = 'docs'
var pointerContainerName = 'grpointers'

resource resourceGroup 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: resourceGroupName
  location: location
}
 
module storageAccount './StorageAccount.bicep' = {
  name: 'storageDeployment'
  scope: resourceGroup
  params: {
    location: location
    storageAccountName: stoAccountName
    docContainerName: docContainerName
    pointerContainerName: pointerContainerName
  }
}
