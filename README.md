# About

Used to hold some scripts I use to play with different tools.

# Kubernetes scripts

Scripts I have used to deploy many different services in GKE (Google) and OKE (Oracle)

As of now the Kubernetes folder contains three subfolders:
* GENERIC: Plenty of YML files to deploy all kind of services (mysql, cassandra, etc) They are not production ready. They are mainly used to test the Kubernetes cluster but they may be interesting to play with them to test features.
* OKE: Some specific scripts to downsize the cluster, to setup INGRESS, and to create a Storage Type which guarantees that Pods and VolumeClaims are on the same AD
* GKE: Some specific scripts to downsize the cluster and to create a Storage Type which guarantees that Pods and VolumeClaims are on the same zone

The main differences within OKE and GKE:
* Billing model
  * OKE does only charge for the used infrastructure - GKE charges for the infrastructure and a constant fee for the service
  * GKE has the possibility to use a "servless" kubernetes. You just deploy PODs and you only pay per PODs running, forgetting about the infrastructure
  * The different INGRESS/EGRESS prices for each cloud
* Thinks setup from the start (As for example Ingress/LoadBalancer)
  * In OKE 
    * You have to set the Type of your services to LoadBalancer - There is no Ingress resource created automatically on the cluster
    * If you want an Ingress resource you can create one by following https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengsettingupingresscontroller.htm
    * This ingress resource will work as the one setup directly on GKE
  * In GKE you setup the type of your services to ClusterIP and you add an Ingress resource pointing to this service
* OKE comes with the _Service Mesh_ assistant which helps to deploy a full service mesh architecture (to automate monitotring with Grafana, to guarantee TLS traffic within PODs and route the traffic, to create an Ingress service, etc)
