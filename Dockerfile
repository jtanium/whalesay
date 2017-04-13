FROM nginx:mainline-alpine

RUN apk add --no-cache php5-fpm

COPY default.conf /etc/nginx/conf.d/default.conf

COPY html /usr/share/nginx/html
