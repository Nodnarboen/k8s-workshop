#!/bin/bash

read -p 'AttendeeID: ' attendeeID
read -p 'API Token: ' apitoken
read -p 'PaaS Token: ' paastoken

export attendID=$attendID
export apitoken=$apitoken
export paastoken=$paastoken

kubectl create clusterrolebinding cluster-admin-binding \
  --clusterrole cluster-admin \
  --user $(gcloud config get-value account) \
  
kubectl create namespace dynatrace

kubectl create -f https://raw.githubusercontent.com/Dynatrace/dynatrace-oneagent-operator/v0.3.1/deploy/kubernetes.yaml

kubectl -n dynatrace create secret generic oneagent --from-literal="apiToken=$apitoken" --from-literal="paasToken=$paastoken"

# read the yml template from a file and substitute the string 
# {{MYVARNAME}} with the value of the MYVARVALUE variable
template=`cat "cr.yaml" | sed "s/{{attendeeID}}/$attendeeID/g"`

# apply the yml with the substituted value
echo "$template" | kubectl create -f -
