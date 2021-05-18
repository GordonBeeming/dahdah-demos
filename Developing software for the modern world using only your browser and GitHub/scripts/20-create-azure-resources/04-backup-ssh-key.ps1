az storage account list
az storage account create --name $KeyStorageAccountName --resource-group $ResourceGroupName --location $HostLocation --sku Standard_LRS

$RespJson = az storage account keys list --resource-group $ResourceGroupName --account-name $KeyStorageAccountName | Out-string | ConvertFrom-Json
$StorageKey = $RespJson[0].value
az storage container list --account-name $KeyStorageAccountName --account-key "$StorageKey"

az storage container create --name keys --account-name $KeyStorageAccountName --account-key "$StorageKey"

az storage blob upload --container-name keys --file ~/.ssh/id_rsa.pub --name id_rsa.pub --account-name $KeyStorageAccountName --account-key "$StorageKey"
az storage blob upload --container-name keys --file ~/.ssh/id_rsa --name id_rsa --account-name $KeyStorageAccountName --account-key "$StorageKey"