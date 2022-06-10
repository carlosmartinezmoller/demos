echo "This will allow you to access Flink without exposing a public IP for it"
echo "The script starts a proxy to your kubernetes cluster"
echo "Access flink on the URL http://localhost:8087"
kubectl port-forward $(kubectl get pod --selector="app=flink" --output jsonpath='{.items[0].metadata.name}') 8087:8081

