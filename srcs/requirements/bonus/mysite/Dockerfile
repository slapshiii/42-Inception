FROM alpine:3.13

ENV NODE_ENV=production

RUN set -eu && \
	addgroup -g 1000 node && \
	adduser -u 1000 -G node -s /bin/sh -D node && \
	apk add --no-cache curl nodejs npm

COPY ./docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT [ "/docker-entrypoint.sh" ]

WORKDIR /app

COPY ./static-site/ .

EXPOSE 3000

CMD [ "npm", "run", "start" ]