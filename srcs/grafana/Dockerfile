FROM alpine:3.12

RUN apk update
RUN apk add --no-cache supervisor wget tar
RUN apk add vim musl-dev libc6-compat

RUN mkdir -p /run/grafana-server
RUN mkdir -p /run/telegraf

RUN mkdir -p /var/lib/grafana
RUN mkdir -p /var/lib/grafana/dashboards
RUN mkdir -p /usr/share/grafana/plugins
RUN mkdir -p /var/log/grafana

RUN wget https://dl.grafana.com/oss/release/grafana-7.4.5.linux-amd64.tar.gz
RUN tar -zxvf grafana-7.4.5.linux-amd64.tar.gz
RUN cp -r /grafana-7.4.5/bin/grafana-server /usr/bin/
RUN cp -r /grafana-7.4.5/plugins-bundled/* /usr/share/grafana/plugins
RUN cp -r /grafana-7.4.5/public /usr/share/grafana/
RUN cp -r /grafana-7.4.5/conf /usr/share/grafana/

RUN rm -rf grafana-7.4.5.linux-amd64.tar.gz
RUN rm -rf grafana-7.4.5

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.16.3_static_linux_amd64.tar.gz
RUN tar xf telegraf-1.16.3_static_linux_amd64.tar.gz
RUN cp -r telegraf-1.16.3/* ./

RUN rm -rf telegraf-1.16.3
RUN rm -rf telegraf-1.16.3_static_linux_amd64.tar.gz

COPY my_dashboard.json /var/lib/grafana/dashboards/
COPY telegraf.conf /etc/telegraf/telegraf.conf
COPY dashboard.yaml /usr/share/grafana/conf/provisioning/dashboards/
COPY datasources.yaml /usr/share/grafana/conf/provisioning/datasources/
COPY grafana.ini /etc/grafana.ini
COPY supervisord.conf /etc/supervisord.conf

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
