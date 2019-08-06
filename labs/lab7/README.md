# Process Detection for Canary Deployment

### 1. Deploy the Canary Release 

```bash
 ./deploy-canary.sh
```

Execute <b>kubectl get pods -n production -o wide</b> and you will see you now have both stable and canary releases running

![JSON](https://github.com/Nodnarboen/HOT-k8s/blob/master/assets/Picture21.png)

Wait 1-2 minutes then look the Services in Dynatrace. You have 2 services in production, one for stable and one for canary release.
For monitoring purposes, it should be the same service

![JSON](https://github.com/Nodnarboen/HOT-k8s/blob/master/assets/Picture22.png)

### 2. Process Detection Rule Config

In the Dynatrace console, go in Settings -> Processes and containers -> Process group detection.

Expand the Process detection rules section. 

Click <b>Add detection</b> rule.

Select Use a process property

![JSON](https://github.com/Nodnarboen/HOT-k8s/blob/master/assets/Picture23.png)

We want to apply this rule for pods running in production only (namespace=production)

Also, extract the identifier after the "." in the pod name. 
Remember the pod names have ".stable "or ".canary" in their name to distinguish them

![JSON](https://github.com/Nodnarboen/HOT-k8s/blob/master/assets/Picture24.png)

Recycle both stable and canary frontend pods. The process detection rules are applied on process startup.

<b>./recycle-sockshop-frontend.sh </b>

Make sure the pods are ready 

<b>kubectl get deployments -n production -l tier=frontend</b>

Merge the services at Settings -> Server-side service monitoring -> Merge Service

![JSON](https://github.com/Nodnarboen/HOT-k8s/blob/master/assets/Picture26.png)

### 3. Validate

![JSON](https://github.com/Nodnarboen/HOT-k8s/blob/master/assets/Picture25.png)

You can now apply Stable vs Canary Multi-dimensional analysis views.

![JSON](https://github.com/Nodnarboen/HOT-k8s/blob/master/assets/Picture26.png)

![JSON](https://github.com/Nodnarboen/HOT-k8s/blob/master/assets/Picture27.png)

:arrow_up: [Back to TOC](/README.md) :arrow_left: [Prev](../la6/README.md) 


