az deployment group create `
	--name aneutovidehdeployment `
	--template-file ./EmptyResourceGroup.bicep `
	--resource-group aneutov-idh-rs `
	--mode complete