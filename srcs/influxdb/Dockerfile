FROM alpine:3.12

RUN apk update
RUN apk add --no-cache supervisor
RUN apk add vim
RUN apk add influxdb
RUN apk add wget tar

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.16.3_static_linux_amd64.tar.gz
RUN tar xf telegraf-1.16.3_static_linux_amd64.tar.gz
RUN cp -r telegraf-1.16.3/* ./
RUN rm -rf telegraf-1.16.3
RUN rm -rf telegraf-1.16.3_static_linux_amd64.tar.gz

RUN mkdir -p /run/influxd
RUN mkdir -p /run/telegraf
RUN mkdir -p /var/lib/influxdb
RUN chown -R influxdb:influxdb /var/lib/influxdb

COPY supervisord.conf /etc/supervisord.conf
COPY telegraf.conf /etc/telegraf/telegraf.conf

#EXPOSE 3306

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
