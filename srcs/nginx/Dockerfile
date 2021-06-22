FROM alpine:3.12

RUN apk update
RUN apk add --no-cache supervisor nginx wget tar

RUN mkdir -p /run/nginx
RUN mkdir -p /run/telegraf

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.16.3_static_linux_amd64.tar.gz
RUN tar xf telegraf-1.16.3_static_linux_amd64.tar.gz
RUN cp -r telegraf-1.16.3/* ./

RUN rm -rf telegraf-1.16.3
RUN rm -rf telegraf-1.16.3_static_linux_amd64.tar.gz

COPY ./telegraf.conf /etc/telegraf/telegraf.conf
COPY ./supervisord.conf /etc/supervisord.conf
COPY ./default.conf /etc/nginx/conf.d/default.conf
COPY ./private.key /etc/nginx/ssl/private/private.key
COPY ./certs.crt /etc/nginx/ssl/certs/certs.crt

EXPOSE 80 443

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
