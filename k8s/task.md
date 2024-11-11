## Tasks
* [x] Launch Minikube
* [x] Deploy pong pod and service using custom `selector`
* [x] Set ingress route to each application
  * 어떻게 하면 ingress에서 모든 경로를 핸들링 할 수 있을지
  * host 이름 따라서 응답?
* [x] Test node port



## Commands
### Apply k8s manifest
```
kubectl apply -f [ . | FILE_PATH ]
```

### check LISTEN ports on Mac
`sudo lsof -i -P | grep LISTEN `

### Install nginx ingress controller
```sh
helm upgrade --install ingress-nginx ingress-nginx \
  --repo https://kubernetes.github.io/ingress-nginx \
  --namespace ingress-nginx --create-namespace
```

### Running fastapi app
```
# cd to git clone path
python3 -m venv .
source bin/activate
pip install -r requirements.txt
fastapi dev app/main.py
deactivate
```
