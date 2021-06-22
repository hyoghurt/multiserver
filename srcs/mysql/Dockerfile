FROM alpine:3.12

RUN apk update
RUN apk add --no-cache supervisor wget tar
RUN apk add mysql
RUN apk add mysql-client
RUN apk add mariadb-dev
RUN apk add vim

RUN mkdir -p /run/mysqld
RUN chown mysql:mysql /run/mysqld

RUN mkdir -p /var/log/mysql
RUN mkdir -p /var/lib/mysql
RUN mkdir -p /run/telegraf

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.16.3_static_linux_amd64.tar.gz
RUN tar xf telegraf-1.16.3_static_linux_amd64.tar.gz
RUN cp -r telegraf-1.16.3/* ./

RUN rm -rf telegraf-1.16.3
RUN rm -rf telegraf-1.16.3_static_linux_amd64.tar.gz

RUN sed -i "s|.*skip-networking.*|#skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf
#RUN /usr/bin/mysql_install_db --user=mysql --datadir=/var/lib/mysql
#RUN sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf
RUN chown -R mysql:mysql /var/lib/mysql
RUN chown -R mysql:mysql /var/log/mysql

COPY telegraf.conf /etc/telegraf/telegraf.conf
COPY create_user.sql .
COPY wordpress_3.sql .
COPY run.sh .
COPY supervisord.conf /etc/supervisord.conf

#EXPOSE 3306
CMD /usr/bin/mysql_install_db --user=mysql --datadir=/var/lib/mysql ; /usr/bin/supervisord -c /etc/supervisord.conf
