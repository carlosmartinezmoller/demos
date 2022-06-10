# In OKE compared to GKE there is no Ingress resource created when you deploy the OKE cluster
# This can be seen as either a good thing (less resources on the initial cluster) or an annoying thing (you have to perform extra steps to setup the cluster)
# In any case, I believe in general it is practical to have an Ingress resource if you are exposing your services, which is the common pattern
# This script will create the Ingress resource
# It is based on the documentation https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengsettingupingresscontroller.htm
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-$(curl -s https://github.com/kubernetes/ingress-nginx | egrep -o “v[0-9].[0-9].[0-9]*” | sort -n | tail -1)/deploy/static/provider/cloud/deploy.yaml
echo "You may want to increase the replicas of your ingress if you see that the Load Balancer is on critical state. The above script registers at Load Balancer level all of the cluster nodes: 'kubectl scale --replicas=<number of nodes on your cluster deployment ingress-nginx-controller -n ingress-nginx'"
