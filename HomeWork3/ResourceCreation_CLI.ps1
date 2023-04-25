$resourceGroupName = "aneutov-idh-rs"
$stoAccountName = "aneutovidhstorage"
$docsContainerName = "docs"
$pointerContainerName = "grpointers"

az group create --location westus --name $resourceGroupName
az storage account create `
	--resource-group $resourceGroupName `
	--name $stoAccountName `
	--location westus `
	--access-tier Hot `
	--kind BlobStorage `
	--sku Standard_LRS
az storage account blob-service-properties update `
    --account-name $stoAccountName `
    --resource-group $resourceGroupName `
    --enable-versioning $true
az storage container create `
    --account-name $stoAccountName `
	--name $docsContainerName `
	--public-access off
az storage container create `
    --account-name $stoAccountName `
	--name $pointerContainerName `
	--public-access off