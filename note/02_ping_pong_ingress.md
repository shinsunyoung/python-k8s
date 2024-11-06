01번에서 ingress를 추가하여 도메인으로 접근할 수 있도록 설정한다.

```
apiVersion: v1
kind: Service
metadata:
  name: external-ping
  namespace: ingress-nginx # 얘를 alias로 하는
spec:
  type: ExternalName
  externalName: ping.default.svc.cluster.local # 기본적으로 쿠버네티스에서 사용하는것
```

```
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: nginx-ingress
  namespace: ingress-nginx
spec:
  ingressClassName: nginx
  rules:
    - host: test.my.local # 어떤 호스트를 받아서 처리할건지 (L7)
      http:
        paths:
          - path: /ping
            pathType: Prefix
            backend:
              service:
                name: external-ping
                port:
                  name: ping

          - path: /name
            pathType: Prefix
            backend:
              service:
                name: external-ping
                port:
                  number: 8080
```

/etc/host에 아래와 같이 추가
```
127.0.0.1       test.my.local
```

```
$ curl test.my.local/ping
"pong"%        
```




ref. https://kubernetes.io/ko/docs/tasks/access-application-cluster/ingress-minikube/