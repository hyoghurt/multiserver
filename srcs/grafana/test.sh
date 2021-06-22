#!/bin/bash

#docker build --build-arg HAHAHA=huhuhu . -t my-grafana
docker build . -t my-grafana
kubectl apply -f grafana.yaml
