# List the pod running SQL Server
kubectl get pods

# Delete the pod
kubectl delete pod mssql-deployment-cdc47fc9b-px9p4

# Verify 
kubectl get pods
kubectl get services
