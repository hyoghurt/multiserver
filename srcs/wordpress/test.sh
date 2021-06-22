#!/bin/bash

docker build . -t my-wordpress
kubectl apply -f wordpress.yaml
