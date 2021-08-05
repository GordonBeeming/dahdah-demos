az --version

# az upgrade
sudo apt remove azure-cli -y && sudo apt autoremove -y
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

az --version

az login

$SubscriptionName = "MVP - Dev Tech"

az account show --output table
az account list --output table
az account set --subscription $SubscriptionName
$CurrentAccount = az account show | Out-string | ConvertFrom-Json
$SubscriptionId = $CurrentAccount.id


$ResourceGroup = "AzDO-Deployments"
$Location = northeurope
az group create --location $Location --name $ResourceGroup



$AdminUsername = "superboss"
$VMScaleSetName = "vmssagentspool"
az vmss create `
--name $VMScaleSetName `
--resource-group $ResourceGroup `
--image UbuntuLTS `
--vm-sku Standard_D2_v3 `
--storage-sku StandardSSD_LRS `
--authentication-type SSH `
--instance-count 0 `
--disable-overprovision `
--upgrade-policy-mode manual `
--single-placement-group false `
--platform-fault-domain-count 1 `
--load-balancer '""' `
--admin-username $AdminUsername

az vmss show --resource-group $ResourceGroup --name $VMScaleSetName --output table



# Create a service principal
$DeploymentServicePrincipalName = "$($ResourceGroup)SP"
$DeploymentServicePrincipalInfo = az ad sp create-for-rbac --name $DeploymentServicePrincipalName --role contributor --scopes "/subscriptions/$($SubscriptionId)/resourceGroups/$($ResourceGroup)" --sdk-auth | Out-string | ConvertFrom-Json

@"

# Subscription Id
$($SubscriptionId)

# Subscription Name
$($SubscriptionName)

# Service Principal Id
$($DeploymentServicePrincipalInfo.clientId)

# Service Principal key
$($DeploymentServicePrincipalInfo.clientSecret)

# Tenant Id
$($DeploymentServicePrincipalInfo.tenantId)

# Service connection name
$($SubscriptionName) - $($ResourceGroup) - contributor

# Service Principal Info
$($DeploymentServicePrincipalInfo | ConvertTo-Json)

"@

