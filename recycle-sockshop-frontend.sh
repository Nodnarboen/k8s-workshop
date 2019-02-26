kubectl scale --replicas=0 --current-replicas=1 deployments -l tier=frontend -n production
sleep 10s
kubectl get deployments -n production -l tier=frontend
kubectl scale --replicas=1 --current-replicas=0 deployments -l tier=frontend -n production
sleep 10s
kubectl get deployments -n production -l tier=frontend

kubectl scale --replicas=0 --current-replicas=1 deployments -l tier=frontend -n dev
sleep 10s
kubectl get deployments -n dev -l tier=frontend
kubectl scale --replicas=1 --current-replicas=0 deployments -l tier=frontend -n dev
sleep 10s
kubectl get deployments -n dev -l tier=frontend
