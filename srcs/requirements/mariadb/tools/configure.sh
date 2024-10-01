#!/bin/sh

if [ ! -d "/var/lib/mysql/$DB_NAME" ]; then
    mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql
    
    echo "Starting MySQL in safe mode without network"
    mysqld_safe --skip-networking &
    
    until mysql -h localhost -u root -e "status" >/dev/null 2>&1; do
        echo "Waiting for MySQL to be ready..."
        sleep 5
    done

    mysql -e "CREATE USER '$DB_USER'@'%' IDENTIFIED BY \"$DB_PASS\";"
    mysql -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' WITH GRANT OPTION;"
    mysql -e "CREATE DATABASE $DB_NAME;"
    mysql -e "FLUSH PRIVILEGES;"
    
    mysqladmin --user=root shutdown
    echo "Successfully added $DB_USER to the database"
fi

exec "$@"