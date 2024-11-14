#!/bin/bash -e
curl --proto '=https' --tlsv1.2 -sSfL https://run.linkerd.io/install-edge | sh
echo "export PATH=$HOME/.linkerd2/bin:$PATH" >> ~/.bashrc
linkerd check --pre
linkerd viz install | kubectl apply -f - # install the on-cluster metrics stack
linkerd check
linkerd viz dashboard &

