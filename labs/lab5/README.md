# Container Environment Variables

### 1. Adding Environment variables

Add some Environment Variables to the /k8s-workshop/manifests/sockshop-app/production/front-end.yml

Make sure that the indentation is correct and that they aren't any error promptings

```bash
        env:
        - name: DT_TAGS
          value: "product=sockshop"
        - name: DT_CUSTOM_PROP
          value: "SERVICE_TYPE=FRONTEND"
```

![JSON](https://github.com/Nodnarboen/k8s-workshop/blob/master/assets/Picture13.png)

After saving, you will need to re-apply the change.

```bash
kubectl apply -f ~/k8s-workshop/manifests/sockshop-app/production/front-end.yml
./recycle-sockshop-frontend.sh
```

### 2. Validate

Once working, you can validate the change in Dynatrace

![JSON](https://github.com/Nodnarboen/k8s-workshop/blob/master/assets/Picture14.png)

:arrow_up: [Back to TOC](/README.md) :arrow_left: [Prev](../lab4/README.md)   :arrow_right: [Next](../lab6/README.md)  
