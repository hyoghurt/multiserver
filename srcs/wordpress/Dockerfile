FROM alpine:3.12

RUN apk update
RUN apk add --no-cache supervisor nginx wget tar
RUN apk add php7-fpm php7-mcrypt php7-soap php7-openssl php7-gmp php7-pdo_odbc php7-json php7-dom php7-pdo php7-zip php7-mysqli php7-sqlite3 php7-apcu php7-pdo_pgsql php7-bcmath php7-gd php7-odbc php7-pdo_mysql php7-pdo_sqlite php7-gettext php7-xmlreader php7-xmlrpc php7-bz2 php7-iconv php7-pdo_dblib php7-curl php7-ctype php7-mbstring 
#RUN apk add php7-common php7-pear php7-ftp php7-imap php7-mysqli php7-json php7-soap php7-litespeed php7-sockets php7-bcmath php7-opcache php7-zlib php7-gettext php7-intl php7-session php7-embed php7-wddx php7-dba php7-ldap php7-xsl php7-exif php7-pspell php7-sysvmsg php7-shmop php7-phpdbg php7-enchant php7-sysvsem php7-pcntl php7-calendar php7-snmp php7-posix php7-doc php7-xml php7-dev php7-cgi php7-sysvshm php7-pgsql php7-tidy php7-phar php7-mysqlnd
RUN apk add vim

RUN mkdir -p /run/nginx
RUN mkdir -p /run/php
RUN mkdir -p /run/telegraf

RUN wget https://wordpress.org/wordpress-5.7.tar.gz
RUN tar -xzvf wordpress-5.7.tar.gz
RUN mv wordpress/ /var/lib/
RUN rm -rf wordpress-5.7.tar.gz

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.16.3_static_linux_amd64.tar.gz
RUN tar xf telegraf-1.16.3_static_linux_amd64.tar.gz
RUN cp -r telegraf-1.16.3/* ./

RUN rm -rf telegraf-1.16.3
RUN rm -rf telegraf-1.16.3_static_linux_amd64.tar.gz

COPY telegraf.conf /etc/telegraf/telegraf.conf
COPY supervisord.conf /etc/supervisord.conf
COPY default.conf /etc/nginx/conf.d/default.conf
COPY wp-config.php /var/lib/wordpress/wp-config.php

RUN chown -R nginx:nginx /var/lib/wordpress

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
