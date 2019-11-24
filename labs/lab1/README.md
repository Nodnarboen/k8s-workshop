# Setting up your Google Kubernetes Environment (GKE)

### 1. Sign up for a Google Cloud Platform Account

Head over to https://cloud.google.com/free/ and sign up for a free GCP account with your existing Google account. 

You can also signup for a new Google Account if you don't have one

Upon signup, you will have free credits tied to your GCP account. (12 months + 400AUD)

You can login to your GCP console [here](https://console.cloud.google.com/home/).

![GCP-Homepage](https://github.com/Nodnarboen/HOT-k8s/blob/master/assets/Picture1.png)

### 2. Enable Kubernetes Engine API 

You will also need to <b>Enable your API Billing</b> with Kubernetes Engine API. 

![k8s-Engine](https://github.com/Nodnarboen/HOT-k8s/blob/master/assets/Picture3.png)

You should be prompted to the billing page while setting up your GKE instance. 

If not, you can follow the steps [here](https://support.google.com/googleapi/answer/6158867?hl=en)

### 3. Activate Cloud Shell

![GKE-Menu](https://github.com/Nodnarboen/HOT-k8s/blob/master/assets/Picture4.png)

Click on the Terminal Icon on the top right

A Cloud based Terminal lookalike will appear at the bottom of the page

We will start setting up our GKE Cluster 

### 3. Create your GKE Cluster

![GKE-CLI](https://github.com/Nodnarboen/HOT-k8s/blob/master/assets/Picture5.png)

For example for Australia Southeast, the command will be 

```bash
gcloud config set compute/zone australia-southeast1-a
```

Create your GKE cluster named <b>k8sworkshop</b> running Ubuntu in GKE with the following command

```bash
gcloud container clusters create k8sworkshop --image-type=ubuntu
```

Once completed, you will have a running GKE Cluster!

![GKE-CLI](https://github.com/Nodnarboen/HOT-k8s/blob/master/assets/Picture6.png)

Running <b>kubectl get nodes</b> will reveal number of nodes

:arrow_up: [Back to TOC](/README.md)  :arrow_right: [Next](../lab2/README.md)

