# multiserver
This script will setup all applications: `./setup.sh`
```
minikube
```
```
Docker
Kubernetes
```
```
Nginx
WordPress
MySQL
phpMyAdmin
FTPS
Grafana
InfluxDB
```
```
supervisor
telegraf
```
Each server runs in a separate container. Containers built using Alpine Linux. Dockerfile is written for each container. Load Balancer have a single ip. 

WordPress - website listening on port 5050, which work with a MySQL database. Both services run in separate containers. The WordPress website have several users and an administrator. Wordpress have own nginx server.

phpMyAdmin - listening on port 5000 and linked with the MySQL database. PhpMyAdmin have own nginx server.

nginx - server listening on ports 80 and 443. Port 80 have redirection of type 301 to 443.
This container allow access to a /wordpress route that makes a redirect 307 to IP:WPPORT.
It also allow access to /phpmyadmin with a reverse proxy to IP:PMAPORT.

Grafana - platform, listening on port 3000, linked with an InfluxDB database. Grafana monitoring all containers. Already has a dashboard configured when building the container. InfluxDB and grafana are in two distincts containers.

If one of the two database containers crashes or stops, the data is not deleted. All containers are able to restart in the event of a failure or stoppage of one of its component parts.  

FTPS, Grafana, Wordpress, PhpMyAdmin and NGINX - LoadBalancer. Influxdb and MySQL - ClusterIP.
![server](https://github.com/hyoghurt/services/raw/master/server.png)
