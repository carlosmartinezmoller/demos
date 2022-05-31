# About

Scripts I used to test GKE (GoogleCloud Kubernetes Engine)
They are simple scripts:
* They don't setup high availability
* They don't implement clusters
* etc

I don't use HELM for this scripts.
I decided not to use Operators neither. For example for Elasticsearch you may prefere to install using an operator as described in https://www.elastic.co/guide/en/cloud-on-k8s/current/k8s-quickstart.html. I chose not to as the test cluster I play with has limited resources.

This scripts are good enough to start with a base infrastructure to test all kind of architectures and to grow from there.

# Scripts included

* 10: A very simple http Hello World to test your instrastructure
* 20: A simple web server but creating all the architecture to make it visibe to the Web (Deployment, Service, Ingress)
* 30: mysql
* 40: redis
* 50: cassandra
* 60: elasticsearch
* 70: kibana (To connect to elasticsearch implemented on step 60): Take into account that server.rewriteBasePath. The idea is to access via LoadBalancer. If you want direct access or proxy access remove this setup.
* 80: zookeeper
* 90: Kafka (Uses zookeeper created in step 80)
* 100: Schema Registry (Uses Kafka created on step 90)
* 110: Kafka Connect (Uses Kafka created on step 90)
* 120: Flink: I implement jobmanager and taskmanager on the same POD for simplicity, to share a single volume to upload libraries
* 1000: Ingress rules to access Kibana. The path will be http://<LoadBalancerIP>/kib
