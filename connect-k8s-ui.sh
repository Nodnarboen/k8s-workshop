#!/bin/bash

kubectl apply -f kubernetes-monitoring-service-account.yaml

echo "Your k8s API URL"
kubectl config view --minify -o jsonpath='{.clusters[0].cluster.server}' &

echo "Your Bearer token"
kubectl get secret $(kubectl get sa dynatrace-monitoring -o jsonpath='{.secrets[0].name}' -n dynatrace) -o jsonpath='{.data.token}' -n dynatrace | base64 --decode &

