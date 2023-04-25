$resourceGroupName = "aneutov-idh-rs"
$stoAccountName = "aneutovidhstorage"
$docsContainerName = "docs"
$pointerContainerName = "grpointers"

New-AzResourceGroup -Name $resourceGroupName -Location "West Us"
New-AzStorageAccount `
	-ResourceGroupName $resourceGroupName `
	-Name $stoAccountName `
	-Location "West Us" `
	-AccessTier Hot `
	-Kind BlobStorage `
	-SkuName Standard_LRS
Update-AzStorageBlobServiceProperty `
    -StorageAccountName $stoAccountName `
    -ResourceGroupName $resourceGroupName `
    -IsVersioningEnabled $true
Get-AzStorageAccount `
	-ResourceGroupName $resourceGroupName `
	-Name $stoAccountName `
	| New-AzStorageContainer -Name $docsContainerName -Permission Off
Get-AzStorageAccount `
	-ResourceGroupName $resourceGroupName `
	-Name $stoAccountName `
	| New-AzStorageContainer -Name $pointerContainerName -Permission Off