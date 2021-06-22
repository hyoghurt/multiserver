#!/bin/bash

docker build . -t my-nginx
kubectl apply -f nginx.yaml
