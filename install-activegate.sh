#!/bin/bash

sudo wget -O Dynatrace-ActiveGate-Linux-x86-1.173.298.sh "https://jlp305.dynatrace-managed.com/e/$1-k8s-performgo-2019/api/v1/deployment/installer/gateway/unix/latest?Api-Token=$2&arch=x86&flavor=default" 
sudo /bin/sh Dynatrace-ActiveGate-Linux-x86-1.173.298.sh 

sleep 10s

sudo cat <<EOF >/var/lib/dynatrace/gateway/config/custom.properties
[http.client.external]
hostname-verification = no
certificate-validation = no
EOF

sudo service dynatracegateway stop 
sleep 10s
sudo service dynatracegateway start
