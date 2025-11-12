## Cluster
k3d cluster delete hdcluster
k3d cluster create hdcluster -s 3 -p "8081:80@loadbalancer" --agents 2
k3d kubeconfig merge
# k3d kubeconfig merge hdcluster
# export KUBECONFIG="$(k3d kubeconfig write hdcluster)"


## Pods
kubectl apply -f hdrouter-pod.yaml 
kubectl get pod
# kubectl exec -it hdrouter-pod -- /bin/bash

#kubectl apply -f hdsvr-pod.yaml 
#kubectl get pod hdsvr-pod 
# kubectl exec --stdin --tty hdsvr-pod -c  broker-container -- /bin/bash
# kubectl exec --stdin --tty hdsvr-pod -c  router-container -- /bin/bash

## Services
kubectl apply -f hdrouter-svc.yaml
kubectl get svc 


## Ingress
kubectl apply -f hd-ing.yaml
kubectl describe ing hd-ing 

