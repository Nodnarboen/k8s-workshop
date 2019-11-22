#!/bin/bash

#command=$(wget -X GET "https://$1.live.dynatrace.com/api/v1/deployment/installer/gateway/unix/latest" -H "accept: application/octet-stream" -H "Authorization: Api-Token $2")
#echo "Downloading Activegate"
#sleep 30s

wget  -O Dynatrace-ActiveGate-Linux-x86-1.179.189.sh "https://$1.live.dynatrace.com/api/v1/deployment/installer/gateway/unix/latest?Api-Token=$2&arch=x86&flavor=default"  
sudo /bin/sh Dynatrace-ActiveGate-Linux-x86-1.179.189.sh   

sleep 10s

sudo chmod 777 -Rf /var/lib/dynatrace/gateway/config/

sudo cat <<EOF > /var/lib/dynatrace/gateway/config/custom.properties
[http.client.external]
hostname-verification = no
certificate-validation = no
EOF

sudo service dynatracegateway stop 
sleep 10s
sudo service dynatracegateway start
