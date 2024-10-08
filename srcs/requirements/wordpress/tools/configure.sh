if [ ! -f "/var/www/html/wp-config.php" ]; then
	echo "Installing wordpress from the $(whoami) user!"

	until mysql -h"$DB_HOST" -u"$DB_USER" -p"$DB_PASS" -e "status" >/dev/null 2>&1; do
        echo "Waiting for MySQL to be ready..."
        sleep 5
    done

	wp --allow-root core download --path=/var/www/html
	wp --allow-root config create --dbname=$DB_NAME \
									--dbuser=$DB_USER \
									--dbpass=$DB_PASS \
									--dbhost=$DB_HOST \
									--dbcharset='utf8'
	wp --allow-root core install --url=$WP_DOMAIN \
								 --title=$WP_TITLE \
								 --admin_user=$WP_ADMIN \
								 --admin_email=$WP_ADMIN_EMAIL \
								 --admin_password=$WP_ADMIN_PASSWORD \
								 --allow-root

	wp user create "$WP_USER" dhussain@student.codam.nl \
								--path="/var/www/html" \
								--user_pass="$WP_PASS" \
								--allow-root
else
	echo "Wordpress is installed!"
fi

exec "$@"