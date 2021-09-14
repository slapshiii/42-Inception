#!/bin/sh
set -e

if [ "$1" = 'redis-server' ]; then
	if [ "$(id -u)" = "0" ]; then
		exec su-exec redis "$0" "$@"
	fi
fi

exec "$@"