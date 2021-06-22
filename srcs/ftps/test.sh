#!/bin/bash

docker build . -t my-ftps
kubectl apply -f ftps.yaml
