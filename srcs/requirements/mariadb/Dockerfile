FROM alpine:3.13

RUN apk update \
	&& apk add --no-cache mariadb mariadb-client su-exec\
 	&& addgroup mysql mysql \
	&& rm -rf /var/lib/mysql \
	&& mkdir -p /var/lib/mysql /run/mysqld /docker-entrypoint-initdb.d \
	&& chown -R mysql:mysql /run/mysqld /var/lib/mysql /docker-entrypoint-initdb.d \
	&& chmod 1777 /var/run/mysqld

VOLUME /var/lib/mysql

COPY ./conf/custom.cnf /etc/my.cnf

COPY ./tools/docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

COPY ./tools/dump.sql /docker-entrypoint-initdb.d/dump_wp.sql

EXPOSE 3306
CMD ["mysqld"]