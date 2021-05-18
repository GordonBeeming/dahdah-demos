$DemoScriptsRoot = Resolve-Path "$($PSScriptRoot)\..\"

$HostLocation = "southafricanorth"

$ResourceGroupName = "githubk8sdemo"

$AKSClusterName = "$($ResourceGroupName)AKSCluster"

$KeyStorageAccountName = "$($ResourceGroupName)stoacc"

$AzureContainerRegistryName = "$($ResourceGroupName)acr"

$SqlServer_ProdDatabaseName = "demo-prod"
$SqlServer_SA_Password = "7eVhEKTu9&eS3SQT*LBrneb9!^H#Y"

$DeploymentServicePrincipalName = "$($ResourceGroupName)SP"