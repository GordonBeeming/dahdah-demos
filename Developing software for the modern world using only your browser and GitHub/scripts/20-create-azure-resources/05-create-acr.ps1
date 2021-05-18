$AcrResponse = az acr create --resource-group $ResourceGroupName --name $AzureContainerRegistryName --sku Basic | Out-string | ConvertFrom-Json
$AcrResponse
$AcrLoginServer = $AcrResponse.loginServer

az aks update --resource-group $ResourceGroupName --name $AKSClusterName --attach-acr $AzureContainerRegistryName
