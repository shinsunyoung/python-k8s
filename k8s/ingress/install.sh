#!/bin/bash -e
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update
helm upgrade --install  nginx ingress-nginx/ingress-nginx -f values.yaml
