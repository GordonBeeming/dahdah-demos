# Create the website deployment
kubectl apply -f "$($DemoScriptsRoot)25-aks/02-website.yaml"

# view the status of the pod, wait for the status to be running
kubectl get pod

# Verify the services are running
kubectl get services

# Get webapp specifically
kubectl get service azure-website --watch


kubectl set image deployment azure-website azure-website=githubk8sdemoacr.azurecr.io/webapp:latest

# kubectl set image deployment azure-website azure-website=githubk8sdemoacr.azurecr.io/webapp:2021.05.18.6

kubectl version

kubectl exec -ti mssql -- nslookup

kubectl get svc --namespace=default

kubectl get endpoints kube-dns --namespace=kube-system
kubectl get endpoints mssql-deployment --namespace=default
