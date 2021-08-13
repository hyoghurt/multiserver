# multiserver
Собрать и запустить мультисервер: `setup.sh`
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
Кластер собран на minikube; Управляет и запускает контейнеры Docker - Kubernetes; Для каждого контейнера написан Dokerfile; Контейнеры собранны на базе Alpine Linux; Для всех серверов один IP адресс;

WordPress - веб-сайт на порту 5050, работает с базой данных MySQL(расположен в другом контейнере). Уже имеет при сборке контейнера нескольких пользователей и администратора. Собран на NGINX.

phpMyAdmin - веб-приложение на порту 5000, связан с контейнером MySQL. Собран на NGINX.

NGINX - веб-сервер слушает 80 и 443 порты. 80 порт делает редирект на 443.  
IP/wordpress делает redirect WordPress  
IP/phpmyadmin делает reverse proxy PhpMyAdmin

FTPS - веб-сервер на 21 порту.

Grafana - платформа для монитора контейнеров, на 3000 порту, связан с базой данных InfluxDB(расположен в другом контейнере). Для сбора метрик в каждом контейнере установлен `tegeraf`. Уже имеет настроенный при сборке контейнера dashboard.

В случае сбоя или остановки одного из двух контейнеров базы данных, данные не теряются. Все контейнеры умеют перезапускаться в случае сбоя или остановки одной из его составных частей.(`supervisor`) FTPS, Grafana, Wordpress, PhpMyAdmin и NGINX - являются LoadBalancer. Influxdb и MySQL - являются ClusterIP.
![server](https://github.com/hyoghurt/services/raw/master/server.png)
