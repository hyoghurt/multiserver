FROM alpine:3.12

RUN apk update
RUN apk add --no-cache supervisor wget tar
RUN apk add vsftpd
RUN apk add vim

RUN mkdir -p /run/vsftpd
RUN mkdir -p /run/telegraf
#RUN mkdir -p /home/user

RUN adduser -D luser
RUN echo "luser:luser" | chpasswd
RUN chmod 755 /home/luser
#RUN chown -R luser /home/luser/

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.16.3_static_linux_amd64.tar.gz
RUN tar xf telegraf-1.16.3_static_linux_amd64.tar.gz
RUN cp -r telegraf-1.16.3/* ./

RUN rm -rf telegraf-1.16.3
RUN rm -rf telegraf-1.16.3_static_linux_amd64.tar.gz

COPY cert.pem /etc/ssl/certs/cert.pem
COPY private.pem /etc/ssl/private/private.pem
COPY telegraf.conf /etc/telegraf/telegraf.conf
COPY supervisord.conf /etc/supervisord.conf
COPY vsftpd.conf /etc/vsftpd/vsftpd.conf

#EXPOSE 21

CMD /bin/chown -R luser /home/luser/ ; /usr/bin/supervisord -c /etc/supervisord.conf
