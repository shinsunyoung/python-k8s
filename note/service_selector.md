```
spec:
  selector:
    devops.app: ping
```

> The set of Pods targeted by a Service is usually determined by a selector that you define. 


- key-value 형태로 설정함 

1. 위의 예제는 `devops.app: ping` 으로 잡혀있는데 Pod에서 실수로 오타가 나서 아래와 같이 설정되었다면?
```
apiVersion: v1
kind: Pod
metadata:
  name: ping
  namespace: default
  labels:
    devops.app: ping-pong
```
=> 502 Bad Gateway 에러가 발생한다. 



2. label로 `devops.app: ping` 으로 설정되어 있는 Pod가 여러개라면?

=> A Pod에 요청이 가기도 하고, B Pod에 요청이 가기도 하며 예상치 못한 결과가 나올 수 있다.






---

ref. https://kubernetes.io/docs/concepts/services-networking/service/#type-clusterip