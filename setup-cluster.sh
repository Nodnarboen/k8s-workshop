#!/bin/bash

# configure the host path volume plugin
oc create -f manifests/oc-scc-hostpath.yml
oc patch scc hostpath -p '{"allowHostDirVolumePlugin": true}'
oc adm policy add-scc-to-group hostpath system:authenticated

# set up the OpenShift registry
oc new-project sockshop-registry
oc project sockshop-registry
oc create serviceaccount pusher
oc policy add-role-to-user system:image-builder system:serviceaccount:sockshop-registry:pusher

oc create -f manifests/oc-imagestreams.yml

oc policy add-role-to-user system:image-puller system:serviceaccount:dev:default -n sockshop-registry
oc policy add-role-to-user system:image-puller system:serviceaccount:production:default -n sockshop-registry
