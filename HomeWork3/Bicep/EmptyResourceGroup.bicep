targetScope = 'subscription'

param location string
var resourceGroupName = 'aneutov-idh-rs'

resource resourceGroup 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: resourceGroupName
  location: location
}
