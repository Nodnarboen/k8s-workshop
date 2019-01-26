#!/bin/bash

oc scale --replicas=0 --current-replicas=1 deployments -l tier=frontend -n production

sleep (5000)

oc get deployments -n production

oc scale --replicas=1 --current-replicas=0 deployments -l tier=frontend -n production

sleep (5000)

oc get deployments -n production
