az group create --name $ResourceGroupName --location $HostLocation
az aks create --resource-group $ResourceGroupName --name $AKSClusterName --node-count 1 --enable-addons monitoring --generate-ssh-keys # --attach-acr $AzureContainerRegistryName

# az aks install-cli
$env:path += '$($env:HOMEPATH)\.azure-kubectl'
$env:path += '$($env:HOMEPATH)\.azure-kubelogin'
az aks get-credentials --resource-group $ResourceGroupName --name $AKSClusterName
kubectl get nodes