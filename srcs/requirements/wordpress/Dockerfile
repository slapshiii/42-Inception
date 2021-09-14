FROM alpine:3.13

RUN set -eux; \
	apk add --no-cache php7-fpm php7-mysqli php7-json php7-session php7-curl \
		php7-zip php7-tokenizer php7-xmlwriter php7-simplexml php7-iconv     \
		php7-dom php7-xml php7-mbstring php7-gettext php7-redis php7-ctype;

VOLUME /var/www/wordpress/

COPY ./tools/docker-entrypoint.sh /
COPY ./conf/php-fpm.conf /etc/php7/php-fpm.conf
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

COPY ./conf/wp-config.php /wp-config.php
RUN apk add --no-cache curl php7 php-phar \
	&& curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& apk del curl \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp

EXPOSE 9000
CMD ["php-fpm7"]