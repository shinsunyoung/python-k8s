#!/bin/bash -e
linkerd install --crds | kubectl apply -f -
linkerd install | kubectl apply -f -
linkerd check
