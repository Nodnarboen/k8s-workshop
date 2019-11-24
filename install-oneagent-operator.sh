#!/bin/bash

read -p 'Dynatrace SaaS(S) or Dynatrace Managed(M) (S/M)?' env

if [[ $env  =~ ^[Ss]$ ]]; then
read -p 'Dynatrace Tenant ID (ex. https://<TENANT_ID>.live.dynatrace.com): ' tenantID
elif [[ $env  =~ ^[Mm]$ ]]; then
read -p 'Dynatrace Tenant ID (ex. https://<TENANT_ID>.dynatrace-managed.com): ' tenantID
read -p 'Dynatrace Environment ID (ex. https://<TENANT_ID>.dynatrace-managed.com/e/<ENVIRONMENT_ID>): ' envID
fi

read -p 'Dynatrace API Token: ' apitoken
read -p 'Dynatrace PaaS Token: ' paastoken

echo ""
echo -e "Please confirm all are correct: "
if [[ $env =~ ^[Ss]$ ]]; then
echo "Your Dynatrace URL is: https://$tenantID.live.dynatrace.com"
elif [[ $env =~ ^[Mm]$ ]]; then
echo "Your Dynatrace URL is: https://$tenantID.dynatrace-managed.com/e/$envID"
fi

echo "Dynatrace API Token: $apitoken"
echo "Dynatrace PaaS Token: $paastoken"
read -p "Is this all correct? (y/n) : " -n 1 -r
echo ""

if [[ $REPLY =~ ^[Yy]$ ]]; then
cat <<EOF > k8s-workshop/var.sh
tenantID=$tenantID
environmentID=$envID
apitoken=$apitoken
paastoken=$paastoken
EOF

kubectl create clusterrolebinding cluster-admin-binding \
  --clusterrole cluster-admin \
  --user $(gcloud config get-value account) \
  
kubectl create namespace dynatrace

kubectl create -f https://raw.githubusercontent.com/Dynatrace/dynatrace-oneagent-operator/v0.3.1/deploy/kubernetes.yaml

kubectl -n dynatrace create secret generic oneagent --from-literal="apiToken=$apitoken" --from-literal="paasToken=$paastoken"

if [[ -f "k8s-workshop/cr.yaml" ]]; then
    rm -f k8s-workshop/cr.yaml
    echo "Removed cr.yaml"
fi

LATEST_RELEASE=v0.3.1
curl -o k8s-workshop/cr.yaml https://raw.githubusercontent.com/Dynatrace/dynatrace-oneagent-operator/$LATEST_RELEASE/deploy/cr.yaml

# read the yml template from a file and values with the strings 

case $envID in
        '')
        echo "SaaS Deployment"
        sed -i 's/apiUrl: https:\/\/ENVIRONMENTID.live.dynatrace.com\/api/apiUrl: https:\/\/'$tenantID'.live.dynatrace.com\/api/' k8s-workshop/cr.yaml
        ;;
        *)
        echo "Managed Deployment"
        sed -i 's/apiUrl: https:\/\/ENVIRONMENTID.live.dynatrace.com\/api/apiUrl: https:\/\/'$tenantID'.dynatrace-managed.com\/e\/'$envID'\/api/' k8s-workshop/cr.yaml
        ;;
        ?)
        usage
        ;;
esac

kubectl create -f k8s-workshop/cr.yaml

fi