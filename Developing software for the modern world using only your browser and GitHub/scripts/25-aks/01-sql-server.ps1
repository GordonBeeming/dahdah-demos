# Import the latest sql 2019 into our acr resource
az acr import --name $AzureContainerRegistryName --source mcr.microsoft.com/mssql/server:2019-latest --image server:2019-latest

# Create the persistent volume claim in Kubernetes
kubectl apply -f "$($DemoScriptsRoot)25-aks\01-pvc.yaml"
# Verify the persistent volume claim
kubectl describe pvc mssql-data
# Verify the persistent volume
kubectl describe pv

# Create an SA password and sa connection string
kubectl create secret generic mssql --from-literal=SA_PASSWORD=$SqlServer_SA_Password
kubectl create secret generic mssqlconnection --from-literal=SA_CONNECTIONSTRING="data source=mssqlinst;initial catalog=$($SqlServer_ProdDatabaseName);user id=sa;password=$($SqlServer_SA_Password);Trusted_Connection=False;MultipleActiveResultSets=true;"

# kubectl delete secret mssql
# kubectl delete secret mssqlconnection

# Create the SQL deployment
kubectl apply -f "$($DemoScriptsRoot)25-aks\01-sqldeployment.yaml"

# view the status of the pod, wait for the status to be running
kubectl get pod

# Verify the services are running
kubectl get services
