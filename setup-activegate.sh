#!/bin/bash

source var.sh

gcloud compute instances create dynatrace-activegate \
--image-family ubuntu-1604-lts \
--image-project ubuntu-os-cloud \
--zone australia-southeast1-a \

gcloud compute scp ~/HOT-k8s/install-activegate.sh \
      dynatrace-activegate:~/ --zone australia-southeast1-a

gcloud compute ssh --zone australia-southeast1-a dynatrace-activegate --command "./install-activegate.sh $attendeeID $paastoken"
