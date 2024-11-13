#!/bin/bash -e
curl --proto '=https' --tlsv1.2 -sSfL https://run.linkerd.io/emojivoto.yml \
  | kubectl apply -f -

# kubectl get -n emojivoto deploy -o yaml \
#  | linkerd inject - \
#  | kubectl apply -f -

linkerd -n emojivoto check --proxy

