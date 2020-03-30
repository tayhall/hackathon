$rg = "Seabusrg"	
$location = "eastus"
New-AzureRmResourceGroupDeployment -Name storageTest `
	                                   -ResourceGroupName $rg `
	                                   -TemplateFile ./azuretemplate.json `
	                                   -location $location `
	                                   -Verbose

# New resource group
New-AzureRmResourceGroupDeployment -Name workspace `
	                                   -ResourceGroupname (New-AzureRmResourceGroup -Name MyAndyrg -location 'eastus').ResourceGroupName `
	                                   -TemplateFile ./Loggy.json `
									   -omsWorkspaceName MyLoggySpace `
									   -omsWorkspaceRegion eastus `
	                                   -Verbose

# New vnet
New-AzureRmResourceGroupDeployment -Name vNet `
	                                   -ResourceGroupName "myAndyrg" `
	                                   -TemplateFile ./resgrp.json `
	                                   -vnetName "vnetIAAS1" `
	                                   -subnetName IAAS1net `
	                                   -Verbose

$rgName = 'myAndyrg'
$rgLocation = 'eastus'

New-AzureRmResourceGroupDeployment -Name Windows `
                                   -ResourceGroupName (New-AzureRmResourceGroup -Name $rgName -Location $rgLocation).ResourceGroupName `
                                   -TemplateFile ./Choice.json `
                                   -platform "Windows" `
                                   -vmNameSuffix "srv" `
                                   -azureLogAnalyticsWorkspaceName "MyLoggySpace" `
                                   -azureLogAnalyticsResourceGroupName "eastus" `
                                   -username "Andrew" `
                                   -ssh "Andrew" `
                                   -vNetName "vnetIAAS1" `
                                   -vNetResourceGroupName $rgName `
                                   -vNetSubnetName "IAAS1net" `
                                   -Verbose