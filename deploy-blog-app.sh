#!/bin/bash

oc adm policy add-scc-to-user anyuid system:serviceaccount:wordpress:default
oc create secret generic mysql-pass --from-literal=password=hot2019
oc apply -f blog-app/
oc expose svc/wordpress
