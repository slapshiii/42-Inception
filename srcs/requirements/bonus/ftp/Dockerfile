FROM alpine:3.13

RUN apk add --no-cache vsftpd openssl \
	&& mkdir -p /etc/ssl/private \
	&& openssl req -newkey rsa:2048 -x509 -days 365 -sha256 -nodes \
		-keyout /etc/ssl/private/vsftpd.key.pem -out /etc/ssl/private/vsftpd.cert.pem \
		-subj "/C=FR/ST=Paris/L=Paris/O=42/OU=phnguyen/CN=inception" \
	&& apk del openssl

COPY ./vsftpd.conf /etc/vsftpd.conf
COPY ./docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

VOLUME [ "/ftps_data" ]

EXPOSE 20 21 20000-20009

ENTRYPOINT [ "/docker-entrypoint.sh" ]

CMD [ "vsftpd" ]