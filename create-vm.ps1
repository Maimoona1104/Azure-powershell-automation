# Variables
$resourceGroup = "MyResourceGroup"
$location = "EastUS"
$vmName = "MyAutomationVM"

# Create Resource Group
New-AzResourceGroup -Name $resourceGroup -Location $location

# Create Virtual Machine
New-AzVM `
  -ResourceGroupName $resourceGroup `
  -Name $vmName `
  -Location $location `
  -VirtualNetworkName "$vmName-vnet" `
  -SubnetName "$vmName-subnet" `
  -SecurityGroupName "$vmName-nsg" `
  -PublicIpAddressName "$vmName-ip" `
  -OpenPorts 22
