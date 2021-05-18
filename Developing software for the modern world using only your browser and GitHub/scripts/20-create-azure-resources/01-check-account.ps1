az --version
az upgrade

az login

az account show --output table
az account list --output table
az account set --subscription "MVP - Dev Tech"
$CurrentAccount = az account show | Out-string | ConvertFrom-Json
$SubscriptionId = $CurrentAccount.id

az provider show -n Microsoft.OperationsManagement -o table
az provider show -n Microsoft.OperationalInsights -o table
az provider show -n Microsoft.ContainerInstance -o table

az provider register --namespace Microsoft.OperationsManagement
az provider register --namespace Microsoft.OperationalInsights
az provider register --namespace Microsoft.ContainerInstance