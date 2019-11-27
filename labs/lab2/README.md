# Install Dynatrace OneAgent Operator for Kubernetes

### Optional Step unless running Containerd
Before running the Oneagent Operator, please make sure that deep monitoring for Containerd Monitoring is enabled

Go to <b>Settings -> Processes and Container -> Container Monitoring</b>

![GKE-CLI-Indentation](https://github.com/Nodnarboen/HOT-k8s/blob/master/assets/Picture6.1.png)

Download codebase from Git repository

``` bash
git clone https://github.com/Nodnarboen/k8s-workshop.git
```

Install OneAgent Operator

``` bash
./k8s-workshop/install-oneagent-operator.sh
```
Within the screen prompt, enter the following details:

1. S or M (Dynatrace SaaS or Managed environment)
2. TenantID
3. EnvironmentID (For Dynatrace Managed ONLY)
4. API Token
- Create one from <b>Settings</b> -> <b>Integration</b> -> <b>Dynatrace API</b>
- Enable <b>Access problem and event feed, metrics, and topology</b> toggle
- Enable <b>Write Configuration</b> toggle (needed for Activegate setup for the next step)
5. Platform-as-a-Service token
- Create one from <b>Settings</b> -> <b>Integration</b> -> <b>Platform as a Service</b>
6. Confirm that the details are correct 

![Setup](https://github.com/Nodnarboen/HOT-k8s/blob/master/assets/Picture7.png)

The script will run and Dynatrace Operator will be installed in your environment. 
And that's it! Dynatrace is now monitoring your GKE Environment!

Steps have been automated from our [official documentation page](https://www.dynatrace.com/support/help/technology-support/cloud-platforms/google-cloud-platform/google-kubernetes-engine/deploy-oneagent-on-google-kubernetes-engine-clusters/)

### Pointers / Troubleshooting Tips:

1. Run <b>kubectl get pods -n dynatrace</b> and you should see <b>Running</b> under status for the pods
2. If needed, run <b>kubectl delete --all pods --namespace=dynatrace</b> to delete all pods. This will cycle through the pods and you will have new pod instances.

Official troubleshooting page could be found [here](https://www.dynatrace.com/support/help/technology-support/cloud-platforms/google-cloud-platform/google-kubernetes-engine/installation-and-operation/full-stack/troubleshoot-oneagent-on-google-kubernetes-engine/)

If everything is working, you will see the hosts appearing under Hosts from clicking Hosts under the left navigation bar.

![GKE-Hosts](https://github.com/Nodnarboen/HOT-k8s/blob/master/assets/Picture7.1.png)

:arrow_up: [Back to TOC](/README.md) :arrow_left: [Prev](../lab1/README.md)   :arrow_right: [Next](../lab3/README.md)  

