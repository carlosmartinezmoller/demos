echo "This will allow you to access Flink without exposing a public IP for it"
echo "The script starts a proxy to your kubernetes cluster"
echo "Access Kibana on the URL http://localhost:5607"
kubectl port-forward $(kubectl get pod --selector="app=kibana" --output jsonpath='{.items[0].metadata.name}') 5607:5601

