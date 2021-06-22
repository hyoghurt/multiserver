#!/bin/bash

#kubectl delete -f mysql.yaml
docker build . -t my-mysql
kubectl apply -f mysql.yaml
