#!/bin/bash

minikube start --vm-driver=virtualbox --memory=4000 --cpus=4
#minikube start --vm-driver=virtualbox --host-only-cidr 192.168.100.1/24 --memory=2000 --cpus=2
#while !(minikube start --host-only-cidr 192.168.49.2/24 --memory=4000 --cpus=2)
#do
#sleep 1
#done

eval $(minikube docker-env)
minikube addons enable metallb
kubectl apply -f ./srcs/metallb-config.yaml
kubectl apply -f ./srcs/pv.yaml

while !(docker build ./srcs/influxdb -t my-influxdb)
do
sleep 1
done
kubectl apply -f ./srcs/influxdb/influxdb.yaml

while !(docker build ./srcs/mysql -t my-mysql)
do
sleep 1
done
kubectl apply -f ./srcs/mysql/mysql.yaml

while !(docker build ./srcs/nginx -t my-nginx)
do
sleep 1
done
kubectl apply -f ./srcs/nginx/nginx.yaml

while !(docker build ./srcs/phpmyadmin -t my-phpmyadmin)
do
sleep 1
done
kubectl apply -f ./srcs/phpmyadmin/phpmyadmin.yaml

while !(docker build ./srcs/wordpress -t my-wordpress)
do
sleep 1
done
kubectl apply -f ./srcs/wordpress/wordpress.yaml

while !(docker build ./srcs/ftps -t my-ftps)
do
sleep 1
done
kubectl apply -f ./srcs/ftps/ftps.yaml

while !(docker build ./srcs/grafana -t my-grafana)
do
sleep 1
done
kubectl apply -f ./srcs/grafana/grafana.yaml
