# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: user42 <user42@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/09/05 10:53:50 by user42            #+#    #+#              #
#    Updated: 2021/09/09 19:58:29 by user42           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.13

RUN apk update \
 && apk add --no-cache nginx openssl \
 && openssl req -newkey rsa:2048 -x509 -days 365 -sha256 -nodes \
 -keyout /etc/ssl/private/inception.key -out /etc/ssl/private/inception.crt \
 -subj "/C=FR/ST=Paris/L=Paris/O=42/OU=phnguyen/CN=inception" \
 && apk del openssl \
 && mkdir -p /run/nginx \
 && mkdir -p /var/www/wordpress \
 && mkdir -p /var/www/adminer

COPY ./conf/nginx.template /etc/nginx/http.d/default.conf

VOLUME /var/www/wordpress/

EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]