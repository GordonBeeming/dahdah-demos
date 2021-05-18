# Create a service principal
$DeploymentServicePrincipalInfo = az ad sp create-for-rbac --name $DeploymentServicePrincipalName --role contributor --scopes "/subscriptions/$($SubscriptionId)/resourceGroups/$ResourceGroupName" --sdk-auth | Out-string | ConvertFrom-Json

$KubeConfigData = Get-Content "$($env:HOME)\.kube/config" | Out-string
$KubeConfigBytes = [System.Text.Encoding]::UTF8.GetBytes($KubeConfigData)
$KubeConfigEncodedData = [Convert]::ToBase64String($KubeConfigBytes)


# New github secrets
@"

# AZURE_CREDENTIALS
$($DeploymentServicePrincipalInfo | ConvertTo-Json)

# REGISTRY_LOGIN_SERVER
$($AzureContainerRegistryName).azurecr.io

# REGISTRY_USERNAME
$($DeploymentServicePrincipalInfo.clientId)

# REGISTRY_PASSWORD
$($DeploymentServicePrincipalInfo.clientSecret)

# RESOURCE_GROUP
$($ResourceGroupName)

# KUBE_CONFIG_DATA
$($KubeConfigEncodedData)

"@