## Tasks
* []Launch Minikube
* []Deploy pong pod and service using custom `selector`
* []Set ingress route to each application
* []Test nodeport



## Commands
### check LISTEN ports on Mac
`sudo lsof -i -P | grep LISTEN `

### Install nginx ingress controller
```
helm upgrade --install ingress-nginx ingress-nginx \
  --repo https://kubernetes.github.io/ingress-nginx \
  --namespace ingress-nginx --create-namespace
```
