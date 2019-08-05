# Install Dynatrace OneAgent Operator for Kubernetes (Containerd)

Follow the installation steps from our [offical documentation page] (https://www.dynatrace.com/support/help/technology-support/cloud-platforms/google-cloud-platform/google-kubernetes-engine/deploy-oneagent-on-google-kubernetes-engine-clusters/)

Please make sure to use the following for the cr.yaml as we are using Containerd + GKE:

``` bash
  env:
  - name: ONEAGENT_CONTAINER_STORAGE_PATH
    value: /home/
    name: ONEAGENT_ENABLE_VOLUME_STORAGE
    value: "true"
```

![GKE-CLI-Indentation](https://github.com/Nodnarboen/HOT-k8s/blob/master/assets/Picture7.png)

### Pointers / Troubleshooting Tips:

1. When editing the cr.yml, make sure the the <b>indentation alignment</b> are correct.

2. Take note of <b>not swapping</b> the declaration of the API and PaaS token in the secret. 

3. If you need got an error regarding the token, you can use <b>kubectl replace -f secret oneagent</b> to remove the current secret

4. If needed, run <b>kubectl delete --all pods --namespace=dynatrace</b> to delete all pods. This will cycle through the pods and you will have new pod instances.

Offical page could be found [here] (https://www.dynatrace.com/support/help/technology-support/cloud-platforms/google-cloud-platform/google-kubernetes-engine/installation-and-operation/full-stack/troubleshoot-oneagent-on-google-kubernetes-engine/)

:arrow_up: [Back to TOC](/README.md) :arrow_left: [Prev](../lab1/README.md)   :arrow_right: [Next](../lab3/README.md)  

