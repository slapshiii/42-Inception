#!/bin/sh

set -eo pipefail

if [ -z $(id -u "$USER" 2> /dev/null) ]; then
	adduser -D --shell /bin/ash "$USER" "$USER"
	echo "$USER:$PASSWORD" | chpasswd
	mkdir -p /ftps_data /var/log/vsftpd
	touch /var/log/vsftpd/vsftpd.log
fi

exec "$@"