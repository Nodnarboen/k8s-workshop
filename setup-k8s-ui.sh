#!/bin/bash

kubectl apply -f kubernetes-monitoring-service-account.yaml

printf "Your k8s API URL\n"
kubectl config view --minify -o jsonpath='{.clusters[0].cluster.server}' && printf "\n"
printf "Your Bearer token\n"
kubectl get secret $(kubectl get sa dynatrace-monitoring -o jsonpath='{.secrets[0].name}' -n dynatrace) -o jsonpath='{.data.token}' -n dynatrace | base64 --decode && printf "\n"

