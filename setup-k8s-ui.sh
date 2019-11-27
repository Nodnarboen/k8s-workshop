#!/bin/bash
source k8s-workshop/var.sh

kubectl apply -f k8s-workshop/kubernetes-monitoring-service-account.yaml

printf "Your k8s API URL\n"
url=$(kubectl config view --minify -o jsonpath='{.clusters[0].cluster.server}')
echo $url 
printf "Your Bearer token\n"
sa=$(kubectl get sa dynatrace-monitoring -o jsonpath='{.secrets[0].name}' -n dynatrace)
bearertoken=$(kubectl get secret $sa -o jsonpath='{.data.token}' -n dynatrace | base64 --decode)
echo $bearertoken

curl -X POST "https://$tenantID.live.dynatrace.com/api/config/v1/kubernetes/credentials" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token $apitoken" -H "Content-Type: application/json; charset=utf-8" -d "{ \"label\": \"k8sworkshop\", \"endpointUrl\": \"$url\", \"authToken\": \"$bearertoken\", \"active\": true, \"endpointStatus\": \"ASSIGNED\", \"endpointStatusInfo\": \"\"}"
printf "\n"
