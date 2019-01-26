#!/bin/bash

oc apply -f manifests/sockshop-app/canary/

oc project production
oc expose svc/front-end-canary
