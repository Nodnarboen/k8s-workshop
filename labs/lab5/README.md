# Container Environment Variables

### 1. Adding Environment variables

Add some Environment Variables to the /k8s-workshop/manifests/sockshop-app/production/front-end.yml

![JSON](https://github.com/Nodnarboen/k8s-workshop/blob/master/assets/Picture13.png)

After saving, you will need to re-apply the change.

```bash
kubectl apply -f front-end.yml
cd /k8s-workshop/
./recycle-sockshop-frontend.sh
```

### 2. Validate

Once working, you can validate the change in Dynatrace

![JSON](https://github.com/Nodnarboen/k8s-workshop/blob/master/assets/Picture14.png)

:arrow_up: [Back to TOC](/README.md) :arrow_left: [Prev](../lab4/README.md)   :arrow_right: [Next](../lab6/README.md)  
