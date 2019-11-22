#!/bin/bash

read -p 'Dynatrace SaaS(S) or Dynatrace Managed(M) (S/M)?' env

if [[ $REPLY =~ ^[Ss]$ ]]
then
read -p 'Dynatrace Tenant ID (ex. https://<TENANT_ID>.live.dynatrace.com): ' tenantID
elif [[ $REPLY =~ ^[Mm]$ ]]
read -p 'Dynatrace Tenant ID (ex. https://<TENANT_ID>.dynatrace-managed.com): ' tenantID
read -p "Dynatrace Environment ID (ex. https://<TENANT_ID>.dynatrace-managed.com/e/<ENVIRONMENT_ID>): " envID
fi

read -p 'Dynatrace API Token: ' apitoken
read -p 'Dynatrace PaaS Token: ' paastoken

echo ""
echo -e "Please confirm all are correct: "
if [[ $REPLY =~ ^[Ss]$ ]]
then
echo "Your Dynatrace URL is: https://$tenantID.live.dynatrace.com"
elif [[ $REPLY =~ ^[Mm]$ ]]
echo "Your Dynatrace URL is: https://$tenantID.dynatrace-managed.com/e/$envID"
fi
echo "Dynatrace API Token: $apitoken"
echo "Dynatrace PaaS Token: $paastoken"

cat <<EOF > var.sh
attendeeID=$attendeeID
apitoken=$apitoken
paastoken=$paastoken
EOF

kubectl create clusterrolebinding cluster-admin-binding \
  --clusterrole cluster-admin \
  --user $(gcloud config get-value account) \
  
kubectl create namespace dynatrace

kubectl create -f https://raw.githubusercontent.com/Dynatrace/dynatrace-oneagent-operator/v0.3.1/deploy/kubernetes.yaml

kubectl -n dynatrace create secret generic oneagent --from-literal="apiToken=$apitoken" --from-literal="paasToken=$paastoken"

if [[ -f "cr.yaml" ]]; then
    rm -f cr.yaml
    echo "Removed cr.yaml"
fi

curl -o cr.yaml https://raw.githubusercontent.com/Dynatrace/dynatrace-oneagent-operator/$LATEST_RELEASE/deploy/cr.yaml

# read the yml template from a file and values with the strings 

case $envID in
        '')
        echo "SaaS Deplyoment"
        sed -i 's/apiUrl: https:\/\/ENVIRONMENTID.live.dynatrace.com\/api/apiUrl: https:\/\/'$tenantID'.live.dynatrace.com\/api/' cr.yaml
        ;;
        *)
        echo "Managed Deployment"
        sed -i 's/apiUrl: https:\/\/ENVIRONMENTID.live.dynatrace.com\/api/apiUrl: https:\/\/'$tenantID'.dynatrace-managed.com\/e\/'$envID'\/api/' cr.yaml
        ;;
        ?)
        usage
        ;;
esac

kubectl create -f cr.yaml
