# Kubernetes Labels & Annotations

For our Hands-On, you will need to run the sample application sock-shop

### 1. Run the Sample App sock-shop

```bash
cd k8s-workshop
./deploy-sockshop.sh
```

Once deployed, you can locate the front-end endpoint from GCP (<b>Kubernetes Engine -> Services & Ingress</b>)

![JSON](https://github.com/Nodnarboen/k8s-workshop/blob/master/assets/Picture10.png)

Once running, you can go to /manifests/sockshop-app/production/front-end.yml to view the content in it

![JSON](https://github.com/Nodnarboen/k8s-workshop/blob/master/assets/Picture11.png)

### 2. Viewership role for service accounts
The OneAgent will use a pod service account to query for its metadata via the Kubernetes REST API.

The service accounts must be granted viewer role in order to have access

In the CLI, execute the following command to grant viewer role 

	$ kubectl create rolebinding serviceaccounts-view --clusterrole=view --	group=system:serviceaccounts:production --namespace=production
You can repeat the procedure for the dev project

	$ kubectl create rolebinding serviceaccounts-view --clusterrole=view --	group=system:serviceaccounts:dev --namespace=dev

Wait for the Dynatrace to pickup the change. Alternatively, you can recycle the apps with k8s-workshop/recycle-sockshop-frontend.sh

### 3. Validate

Once working, you can validate the change in Dynatrace

![JSON](https://github.com/Nodnarboen/k8s-workshop/blob/master/assets/Picture12.png)

:arrow_up: [Back to TOC](/README.md) :arrow_left: [Prev](../lab3/README.md)   :arrow_right: [Next](../lab5/README.md)  


