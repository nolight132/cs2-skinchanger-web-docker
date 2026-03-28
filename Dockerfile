FROM php:8.2-fpm-alpine

RUN apk add --no-cache caddy \
    && docker-php-ext-install mysqli pdo pdo_mysql

WORKDIR /app
COPY . /app

COPY Caddyfile /etc/caddy/Caddyfile

EXPOSE 80

CMD sh -c "php-fpm -D && caddy run --config /etc/caddy/Caddyfile --adapter caddyfile"
