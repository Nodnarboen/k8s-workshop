# Process Group & Service Naming Rules for K8s

### 1a. Process Group Naming Rules

Go in Settings -> Processes and containers -> Process group naming and click Add a new rule

Provide a name to the rule, for example : Kubernetes Project.Namespace.Container

Enter this format : k8s-{ProcessGroup:Kubernetes:pipeline.project}.{ProcessGroup:KubernetesNamespace}.{ProcessGroup:KubernetesContainerName}

In the conditions drop-down, select the property "Kubernetes namespace" and the condition "exists"

![JSON](https://github.com/Nodnarboen/HOT-k8s/blob/master/assets/Picture15.png)

Click on <b>Preview</b>

![JSON](https://github.com/Nodnarboen/HOT-k8s/blob/master/assets/Picture16.png)

Click on <b>Save</b>

### 1b. Validate

Once working, you can validate the change in Dynatrace

![JSON](https://github.com/Nodnarboen/HOT-k8s/blob/master/assets/Picture17.png)

### 2a. Service Naming Rules

Go in Settings -> Server-side service monitoring -> Service naming rules and click Add a new rule

Provide a name to the rule, for example : Kubernetes Project.Namespace.Container

Enter this format : {Service:DetectedName}.{ProcessGroup:KubernetesNamespace}

In the conditions drop-down, select the property "Kubernetes namespace" and the condition "exists"

![JSON](https://github.com/Nodnarboen/HOT-k8s/blob/master/assets/Picture18.png)

Click on <b>Preview</b>

![JSON](https://github.com/Nodnarboen/HOT-k8s/blob/master/assets/Picture19.png)

Click on <b>Save</b>

### 2b. Validate

Once working, you can validate the change in Dynatrace

![JSON](https://github.com/Nodnarboen/HOT-k8s/blob/master/assets/Picture20.png)

:arrow_up: [Back to TOC](/README.md) :arrow_left: [Prev](../lab5/README.md)   :arrow_right: [Next](../lab7/README.md)  
