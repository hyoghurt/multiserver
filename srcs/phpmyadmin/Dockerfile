FROM alpine:3.12

RUN apk update
RUN apk add --no-cache supervisor nginx
RUN apk add php7-fpm php7-mcrypt php7-soap php7-openssl php7-gmp php7-pdo_odbc php7-json php7-dom php7-pdo php7-zip php7-mysqli php7-sqlite3 php7-apcu php7-pdo_pgsql php7-bcmath php7-gd php7-odbc php7-pdo_mysql php7-pdo_sqlite php7-gettext php7-xmlreader php7-xmlrpc php7-bz2 php7-iconv php7-pdo_dblib php7-curl php7-ctype php7-common php7-session php7-xml php7-imap php7-cgi fcgi php7-posix php7-ldap php7-mbstring
RUN apk add vim

RUN mkdir -p /run/nginx
RUN mkdir -p /run/php
RUN mkdir -p /run/telegraf

RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.7/phpMyAdmin-4.9.7-all-languages.tar.gz
RUN tar -xzvf phpMyAdmin-4.9.7-all-languages.tar.gz
RUN mv phpMyAdmin-4.9.7-all-languages /var/lib/phpmyadmin

RUN rm -rf phpMyAdmin-4.9.7-all-languages.tar.gz
RUN chown -R nginx:nginx /var/lib/phpmyadmin

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.16.3_static_linux_amd64.tar.gz
RUN tar xf telegraf-1.16.3_static_linux_amd64.tar.gz
RUN cp -r telegraf-1.16.3/* ./

RUN rm -rf telegraf-1.16.3
RUN rm -rf telegraf-1.16.3_static_linux_amd64.tar.gz

COPY telegraf.conf /etc/telegraf/telegraf.conf
COPY config.inc.php /var/lib/phpmyadmin/
COPY supervisord.conf /etc/supervisord.conf
COPY ./default.conf /etc/nginx/conf.d/default.conf

EXPOSE	5000

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
