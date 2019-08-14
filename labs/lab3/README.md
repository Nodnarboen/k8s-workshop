# Setting up your Kubernetes Overview Page

As per the official instructions [here](https://www.dynatrace.com/support/help/technology-support/cloud-platforms/kubernetes/installation-and-operation/further-integrations/connect-your-kubernetes-clusters-to-dynatrace/) for the Kubernetes integration, you will need to setup an Environment Activegate first.

### 1. Create infrastructure for Activegate

1.1 Within the Google Cloud Shell, enter the following to create a new Compute Engine VM Instance for our Activegate. 

``` bash
gcloud compute instances create dynatrace-activegate \
--image-family ubuntu-1604-lts \
--image-project ubuntu-os-cloud \
--zone australia-southeast1-a \
```
![VM-Setup](https://github.com/Nodnarboen/HOT-k8s/blob/master/assets/Picture8.png)

1.2 Once VM is running, click on the "+" icon within Google Cloud Shell Navigation bar and add a new session with the project. 

![VM-SSH](https://github.com/Nodnarboen/HOT-k8s/blob/master/assets/Picture9.png)

Enter the below to ssh into new session to connect to the VM <b>with the zone</b> you created in lab 1. For example,

``` bash
gcloud compute ssh dynatrace-activegate --zone australia-southeast1-a
```

1.3 Install Activegate

Switch to root user with the following command:

```bash
sudo su
```

Follow these [official steps](https://www.dynatrace.com/support/help/setup-and-configuration/activegate/installation/install-an-environment-activegate/#expand-103if-youre-on-an-ubuntu-server) steps to setup the Activegate

Once completed, you should see Activegate under Deployment Status.

![Activegate-connected](https://github.com/Nodnarboen/HOT-k8s/blob/master/assets/Picture9.1.png)

1.4 Because [security reasons](https://www.dynatrace.com/support/help/shortlink/activegate-configuration-trusted-root-certs), disabling cert validation is the easiest way for our Hands-On

Edit the custom properties file of the Activegate with the following command

``` bash
vi /var/lib/dynatrace/gateway/config/custom.properties
```
Add in the below command in the file

``` bash
[http.client.external]
hostname-verification = no
certificate-validation = no
```

![custom-prop](https://github.com/Nodnarboen/HOT-k8s/blob/master/assets/Picture10.png)


5. Restart Activegate with following commands

``` bash
service dynatracegateway stop 

service dynatracegateway start
```

### 2. Setup the K8S Overview Dashboard

Follow the steps from our offical [documentation page](https://www.dynatrace.com/support/help/technology-support/cloud-platforms/kubernetes/installation-and-operation/further-integrations/connect-your-kubernetes-clusters-to-dynatrace/) to setup the K8S integration

:arrow_up: [Back to TOC](/README.md) :arrow_left: [Prev](../lab2/README.md)   :arrow_right: [Next](../lab4/README.md)  
