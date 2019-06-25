# Install Dynatrace OneAgent Operator for Kubernetes 

Follow the steps from our offical documentation page

https://www.dynatrace.com/support/help/technology-support/cloud-platforms/google-cloud-platform/google-kubernetes-engine/deploy-oneagent-on-google-kubernetes-engine-clusters/

### Pointers / Troubleshooting Tips:

1. When editing the cr.yml, make sure the the <b>indentation alignment</b> are correct.

![GKE-CLI-Indentation](https://github.com/Nodnarboen/HOT-k8s/blob/master/assets/Picture7.png)

2. Take note of <b>not swapping</b> the declaration of the API and PaaS token in the secret. 

3. If you need got an error regarding the token, you can use <b>kubectl replace -f secret </b> to remove the current secret

4. To delete existing pods, run <b>kubectl delete --all pods --namespace=dynatrace</b>

:arrow_up: [Back to TOC](/README.md)


