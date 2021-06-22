#!/bin/sh

#/usr/bin/mysql_install_db --user=mysql --datadir=/var/lib/mysql
#chown -R mysql:mysql /var/lib/mysql
#chown -R mysql:mysql /var/log/mysql

while [ -e ./create_user.sql ]
do
if (/usr/share/mariadb/mysql.server status)
then
mysql -u root < create_user.sql
rm -rf ./create_user.sql
mysql -u root wordpress < wordpress_3.sql
rm -rf ./wordpress_3.sql
fi
done
