kubectl scale --replicas=0 deployment/kube-dns-autoscaler --namespace=kube-system
kubectl scale --replicas=1 deployment/kube-dns --namespace=kube-system
