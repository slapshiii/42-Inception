FROM alpine:3.13

RUN apk update \
	&& apk add su-exec redis \
	&& addgroup redis redis \
	&& mkdir /data && chown redis:redis /data

COPY ./docker-entrypoint.sh /
COPY ./redis.conf /etc/redis.conf
RUN chmod +x /docker-entrypoint.sh

VOLUME /data

ENTRYPOINT [ "/docker-entrypoint.sh" ]

EXPOSE 6379

CMD [ "redis-server", "/etc/redis.conf" ]