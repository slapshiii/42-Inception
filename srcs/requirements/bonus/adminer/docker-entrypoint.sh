#!/bin/sh

set -e

if [ "$(ls -A /var/www/adminer)" ]; then
	echo "skip ADMINER DL"
else
	wget -O /var/www/adminer/adminer.php https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-mysql.php
fi

exec "$@"