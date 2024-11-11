```
apiVersion: v1
kind: Pod
metadata:
  name: ping
  namespace: default
  labels:
    devops.app: ping
spec:
  containers:
    - image: python-test
      imagePullPolicy: IfNotPresent
      name: ping
      ports:
        - containerPort: 8000
          name: ping
          protocol: TCP
      env:
        - name: HOSTNAME
          value: ping
```


```
apiVersion: v1
kind: Service
metadata:
  name: ping
  namespace: default
spec:
  selector:
    devops.app: ping
  ports:
    - protocol: TCP
      port: 8080
      name: ping
      targetPort: ping # 8000
  type: ClusterIP
```

```
$ kk apply -f .
```

이후 service 목록을 확인하면 아래와 같이 ping 서비스가 생성되어 있는 것을 확인할 수 있다.
```
$ kk get svc
NAME         TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)    AGE
kubernetes   ClusterIP   10.96.-.-      <none>        443/TCP    2d14h
ping         ClusterIP   10.101.-.-     <none>        8080/TCP   2d13h
```


```
$ kk port-forward svc/ping 8080:8080
$ curl localhost:8080/ping
> "pong"
```

이렇게 하면 ping 서비스에 대한 요청을 보내고 응답을 받을 수 있다.

- `port-forward`가 필요한 이유?
서비스가 클러스터 내부에서만 접근이 가능하기 때문이다.
`port-forward` 명령을 실행하면 로컬의 8080 포트를 클러스터 내의 ping 서비스로 연결해준다.

ref. https://kubernetes.io/docs/tasks/access-application-cluster/port-forward-access-application-cluster/
