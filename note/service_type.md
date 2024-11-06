
```
spec:
  type: NodePort
  type: ClusterIP
  type: LoadBalancer 
```

### 1. ClusterIP (기본값)
- 클러스터 내부 IP에서 서비스를 노출
  - 클러스터에서 노드가 뜨면 kube-proxy가 내부 IP를 생성함
  - Worker의 IP는 192.0.0.2 이지만 Container의 IP는 10.0.0.1, 10.0.0.2, 10.0.0.3 ... 이런식으로 뜰 수 있는데, 이 IP를 쓰겠다는 것
- 클러스터 내에서만 서비스에 접근이 가능
- Ingress나 Gateway 사용하면 퍼블릭 인터넷에 노출 가능

### 2. NodePort
- 각 노드의 IP에서 정적 포트(NodePort)의 서비스를 노출
- 노드 포트를 사용할 수 있도록 클러스터 IP 주소를 설정

```
ports:
- protocol: TCP
  port: 8080
  name: ping
  targetPort: ping # 8000
nodePort: 30001
```

이렇게 설정되어 있으면 30001번을 8080으로 매핑해서 쓰는 것이고, 8080 포트가 ping 포트로 요청을 보낸다는 뜻

### 3. LoadBalancer
- 외부 로드 밸런서를 사용해 서비스를 노출
- 클라우드 제공업체(e.g. AWS)에서 제공하는 로드 밸런서를 사용 => 실질적으로 로드 밸런서가 존재해야 사용이 가능함
  - AWS의 경우에는 NLB로 뜨게됨


  

---


ref. https://kubernetes.io/docs/concepts/services-networking/service/#publishing-services-service-types