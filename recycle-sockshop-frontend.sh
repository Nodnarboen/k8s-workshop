== PRODUCTION ==
kubectl scale --replicas=0 --current-replicas=1 deployments -l tier=frontend -n production
sleep 5s
kubectl get deployments -n production
sleep 5s
kubectl scale --replicas=0 --current-replicas=1 deployments -l tier=frontend -n production
kubectl get deployments -n production

== DEV ==
kubectl scale --replicas=0 --current-replicas=1 deployments -l tier=frontend -n dev
sleep 5s
kubectl get deployments -n dev
sleep 5s
kubectl scale --replicas=0 --current-replicas=1 deployments -l tier=frontend -n dev
kubectl get deployments -n dev
