#!/bin/bash

oc project production
oc patch deployment front-end.canary -p '{"spec":{"template":{"metadata":{"annotations":{"dynatrace/instrument": "true"}}}}}'

sleep 20s
oc get po -o wide
