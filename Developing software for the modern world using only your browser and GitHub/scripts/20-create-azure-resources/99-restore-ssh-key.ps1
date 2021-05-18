$RespJson = az storage account keys list --resource-group $ResourceGroupName --account-name $KeyStorageAccountName | Out-string | ConvertFrom-Json
$StorageKey = $RespJson[0].value

az storage blob download --container-name keys --file ~/.ssh/id_rsa.pub --name id_rsa.pub --account-name $KeyStorageAccountName --account-key "$StorageKey"
az storage blob download --container-name keys --file ~/.ssh/id_rsa --name id_rsa --account-name $KeyStorageAccountName --account-key "$StorageKey"