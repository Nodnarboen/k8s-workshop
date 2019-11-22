#!/bin/bash

source var.sh

# get latest agent version
command=$(curl -X GET "https://$tenantID.live.dynatrace.com/api/v1/deployment/installer/agent/unix/default/latest/metainfo?flavor=default&arch=all&bitness=all" -H "accept: application/json" -H "Authorization: Api-Token $paastoken")

echo "$command" | sed -r 's/[^0-9.]*//g'



