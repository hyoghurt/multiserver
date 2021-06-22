#!/bin/bash

#kubectl delete -f phpmyadmin.yaml
docker build . -t my-phpmyadmin
kubectl apply -f phpmyadmin.yaml
