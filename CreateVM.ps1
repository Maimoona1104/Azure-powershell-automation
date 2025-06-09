# Variables
$resourceGroup = "MaimoonaResourceGroup"
$location = "EastUS"
$vmName = "MaimoonaVM"
$credential = Get-Credential

# Create Resource Group
New-AzResourceGroup -Name $resourceGroup -Location $location

# Create VM Configuration
New-AzVM `
  -ResourceGroupName $resourceGroup `
  -Name $vmName `
  -Location $location `
  -VirtualNetworkName "$vmName-VNet" `
  -SubnetName "$vmName-Subnet" `
  -SecurityGroupName "$vmName-NSG" `
  -PublicIpAddressName "$vmName-PublicIP" `
  -Credential $credential
