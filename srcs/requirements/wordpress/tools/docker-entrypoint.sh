#!/bin/sh
set -e

if [ "$(ls -A /var/www/wordpress)" ]; then
	echo "skip WP DL"
else
	wget -q -O - https://github.com/WordPress/WordPress/archive/5.7.2.tar.gz | tar -xz -C /var/www/wordpress --strip-components=1
	cp /wp-config.php /var/www/wordpress
	chmod -R +rx /var/www/wordpress
	echo "wordpress downloaded"
fi

bool="$(wp --path=/var/www/wordpress/ plugin list 2> /dev/null | grep redis-cache || true)"
if [ -z "$bool" ]; then
	s=30
	until wp --path=/var/www/wordpress/ plugin install redis-cache || [$s -le 0]
	do
		sleep 1
		s=$((s-1))
	done

	bool="$(wp --path=/var/www/wordpress/ plugin list 2> /dev/null | grep redis-cache || true)"
	if [-z "$bool"]; then
		echo "failure installing redis-plugin"
		exit 1
	fi
	chmod -R +rx /var/www/wordpress
else
	echo "skip REDIS-PLUGIN DL"
fi

wp --path=/var/www/wordpress/ plugin activate redis-cache
wp --path=/var/www/wordpress redis enable

exec "$@"