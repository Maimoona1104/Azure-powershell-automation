# Authenticate to Azure using managed identity
try {
    Connect-AzAccount -Identity
    Write-Output "✅ Successfully authenticated using Managed Identity."
} catch {
    Write-Output "❌ Failed to authenticate: $_"
    exit
}

# Define Variables
$resourceGroup = "MyResourceGroup"
$location = "EastUS"
$vmName = "MyAutomationVM"

# Check if resource group exists, if not create it
if (-not (Get-AzResourceGroup -Name $resourceGroup -ErrorAction SilentlyContinue)) {
    Write-Output "Creating Resource Group..."
    New-AzResourceGroup -Name $resourceGroup -Location $location
} else {
    Write-Output "Resource Group '$resourceGroup' already exists."
}

# Create the virtual machine
try {
    Write-Output "Creating Virtual Machine..."
    New-AzVM `
        -ResourceGroupName $resourceGroup `
        -Name $vmName `
        -Location $location `
        -VirtualNetworkName "$vmName-vnet" `
        -SubnetName "$vmName-subnet" `
        -SecurityGroupName "$vmName-nsg" `
        -PublicIpAddressName "$vmName-ip" `
        -OpenPorts 22

    Write-Output "✅ Virtual Machine '$vmName' creation complete."
} catch {
    Write-Output "❌ Failed to create VM: $_"
}

