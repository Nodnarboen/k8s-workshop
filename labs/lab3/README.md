# Setting up your Kubernetes Overview Page

As per the official instructions [here](https://www.dynatrace.com/support/help/technology-support/cloud-platforms/kubernetes/installation-and-operation/further-integrations/connect-your-kubernetes-clusters-to-dynatrace/) for the Kubernetes integration, you will need to setup an Environment Activegate first.

### 1. Install an Environment Activegate

![VM-Setup](https://github.com/Nodnarboen/HOT-k8s/blob/master/assets/Picture8.png)

1. Default value of 1vCPU, 3.75GB will be sufficient for the Activegate. 

Choose the zone based on where your cluster is running from.

Change the Boot Disk Image to be <b>Ubuntu 16.04</b> matching requirements as per below

https://www.dynatrace.com/support/help/setup-and-configuration/activegate/installation/activegate-hardware-and-system-requirements/

2. One VM is running, click on dropdown button and select <b>open in browser window"</b> 

![VM-SSH](https://github.com/Nodnarboen/HOT-k8s/blob/master/assets/Picture9.png)

3. Switch to root user with <b> sudo su </b> and run Activegate installation steps 

https://www.dynatrace.com/support/help/setup-and-configuration/activegate/installation/install-an-environment-activegate/#expand-103if-youre-on-an-ubuntu-server

4. As we are running this with Dev, disable cert validation in /var/lib/dynatrace/gateway/config/custom.properties

![custom-prop](https://github.com/Nodnarboen/HOT-k8s/blob/master/assets/Picture10.png)

<i>
[http.client.external]

hostname-verification = no

certificate-validation = no
</i>

5. Restart Activegate with

<b>service dynatracegateway stop </b>

<b>service dynatracegateway start </b>

### 2. Setup the K8S Overview Dashboard

Follow the steps from our offical documentation page

https://www.dynatrace.com/support/help/technology-support/cloud-platforms/kubernetes/installation-and-operation/further-integrations/connect-your-kubernetes-clusters-to-dynatrace/

:arrow_up: [Back to TOC](/README.md) :arrow_left: [Prev](../lab2/README.md)   :arrow_right: [Next](../lab4/README.md)  
