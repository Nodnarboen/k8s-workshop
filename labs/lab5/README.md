# Container Environment Variables

### 1. Adding Environment variables

Add some Environment Variables to the /HOT-k8s/manifests/sockshop-app/production/front-end.yml

![JSON](https://github.com/Nodnarboen/HOT-k8s/blob/master/assets/Picture13.png)

After saving, you will need to re-apply the change.

<i>
kubectl apply –f front-end.yml

cd /HOT-k8s/

./recycle-sockshop-frontend.sh
</i>

### 2. Validate

Once working, you can validate the change in Dynatrace

![JSON](https://github.com/Nodnarboen/HOT-k8s/blob/master/assets/Picture14.png)

:arrow_up: [Back to TOC](/README.md)
