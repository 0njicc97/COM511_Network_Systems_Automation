[Personal Learning Record](../../personal_journal/personal_journal.md) | [Session Notes](../sessions/README.md) 

# Session 8

## Topics covered
*What topics were covered in this session*

- Build a docker image using the command ` docker build -t k8s-demo-app:latest .`




## Personal Notes and research following this session
*Which class sessions and personal research refers to technology in this proposal. Link to examples.*

- Docker is used to package and run applications in containers.
- Kubernetes automates the deployment and management of containers.
- Pods are the smallest units in Kubernetes and run application containers.
- Deployments manage pods and ensure the correct number of replicas are running.
- Services provide network access to applications running in pods.
- Health and readiness probes help Kubernetes monitor application availability.



## Exercises and results
*What exercises did you complete. What results. Screen shots and notes*

-build a docker image 

```


PS C:\devel\k8s-beginner-project> docker build -t k8s-demo-app:latest .
[+] Building 1.6s (11/11) FINISHED                                                                 docker:desktop-linux
 => [internal] load build definition from Dockerfile                                                               0.0s
 => => transferring dockerfile: 733B                                                                               0.0s
 => [internal] load metadata for docker.io/library/node:20-alpine                                                  1.1s
 => [internal] load .dockerignore                                                                                  0.0s
 => => transferring context: 2B                                                                                    0.0s
 => [1/6] FROM docker.io/library/node:20-alpine@sha256:fb4cd12c85ee03686f6af5362a0b0d56d50c58a04632e6c0fb8363f609  0.0s
 => [internal] load build context                                                                                  0.1s
 => => transferring context: 134B                                                                                  0.0s
 => CACHED [2/6] RUN addgroup -g 1001 -S nodejs &&     adduser -S nodejs -u 1001                                   0.0s
 => CACHED [3/6] WORKDIR /app                                                                                      0.0s
 => CACHED [4/6] COPY app/package*.json ./                                                                         0.0s
 => CACHED [5/6] COPY app/index.js ./                                                                              0.0s
 => CACHED [6/6] RUN chown -R nodejs:nodejs /app                                                                   0.0s
 => exporting to image                                                                                             0.0s
 => => exporting layers                                                                                            0.0s
 => => writing image sha256:835feffec259d350ec71420f8177ecb94273d23c60f70b9d1ddbf43ee72ff00b                       0.0s
 => => naming to docker.io/library/k8s-demo-app:latest 
                                                             0.0s
```

- The Docker container was successfully launched using the docker run command. The application became accessible on port 3000 and exposed health, readiness, and information endpoints for monitoring and management within Kubernetes.

```

PS C:\devel\k8s-beginner-project> docker run -p 3000:3000 k8s-demo-app:latest
🚀 K8s Demo App v1.0.0 running on port 3000
   Health check: http://localhost:3000/health
   Readiness:    http://localhost:3000/ready
   Info:         http://localhost:3000/info
   
```

- The application was successfully deployed to Kubernetes. The kubectl get all -n k8s-demo command confirmed that three pod replicas were running in the k8s-demo namespace, demonstrating that the deployment was functioning correctly and the application was available within the cluster.

```

PS C:\devel\k8s-beginner-project> kubectl apply -f k8s/namespace.yaml
namespace/k8s-demo created
PS C:\devel\k8s-beginner-project> kubectl apply -f k8s/configmap.yaml
configmap/app-config created
PS C:\devel\k8s-beginner-project> kubectl apply -f k8s/deployment.yaml
deployment.apps/k8s-demo-app created
PS C:\devel\k8s-beginner-project> kubectl apply -f k8s/service.yaml
service/k8s-demo-service created
PS C:\devel\k8s-beginner-project> kubectl get all -n k8s-demo
NAME                                READY   STATUS    RESTARTS   AGE
pod/k8s-demo-app-794cc59779-bfpql   1/1     Running   0          4m13s
pod/k8s-demo-app-794cc59779-gmkvl   1/1     Running   0          4m13s
pod/k8s-demo-app-794cc59779-gx8ds   1/1     Running   0          4m13s

NAME                       TYPE           CLUSTER-IP      EXTERNAL-IP   PORT(S)        AGE
service/k8s-demo-service   LoadBalancer   10.107.12.209   localhost     80:32222/TCP   4m11s

NAME                           READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/k8s-demo-app   3/3     3            3           4m13s

NAME                                      DESIRED   CURRENT   READY   AGE
replicaset.apps/k8s-demo-app-794cc59779   3         3         3       4m13s

```

- The pod logs were monitored using the kubectl logs -f command. The logs confirmed that the application was running successfully on port 3000 and that the health, readiness, and information endpoints were available, indicating a healthy deployment.

```

PS C:\devel\k8s-beginner-project> kubectl logs -f k8s-demo-app-794cc59779-gx8ds -n k8s-demo
🚀 K8s Demo App v1.0.0 running on port 3000
   Health check: http://localhost:3000/health
   Readiness:    http://localhost:3000/ready
   Info:         http://localhost:3000/info
   
```

   




## Summary of learning
*What did you learn through these exercises*

- This exercise helped me understand how to build and run a Docker container and deploy it to Kubernetes. I learned how to create Kubernetes resources such as a Namespace, ConfigMap, Deployment, and Service, and how to verify that pods are running correctly. I also used pod logs to monitor the application and gained practical experience with container management and Kubernetes deployment.