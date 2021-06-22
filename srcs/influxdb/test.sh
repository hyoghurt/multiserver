#!/bin/bash

#kubectl delete -f mysql.yaml
docker build . -t my-influxdb
kubectl apply -f influxdb.yaml
