#!/bin/bash

command=$(curl -X GET "https://$1.live.dynatrace.com/api/v1/deployment/installer/gateway/unix/latest" -H "accept: application/octet-stream" -H "Authorization: Api-Token $2")
echo "Downloading Activegate"
sleep 30s


#sudo wget -O Dynatrace-OneAgent-Linux-1.177.220.sh "https://mou612.managed-sprint.dynalabs.io/e/dynatrace-k8s-$1/api/v1/deployment/installer/gateway/unix/latest?Api-Token=$2&arch=x86&flavor=default" 
#sudo /bin/sh Dynatrace-OneAgent-Linux-1.177.220.sh 

#sleep 10s

#sudo chmod 777 -Rf /var/lib/dynatrace/gateway/config/

#sudo cat <<EOF > /var/lib/dynatrace/gateway/config/custom.properties
#[http.client.external]
#hostname-verification = no
#certificate-validation = no
#EOF

#sudo service dynatracegateway stop 
#sleep 10s
#sudo service dynatracegateway start
