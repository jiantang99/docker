FROM node:stable-alpine

WORKDIR /etc/nginx/conf.d

COPY nginx/nginx.conf . 

RUN mv nginx.conf default.conf

WORKDIR /var/www/html

COPY src .

# Ensures all updates are reflected in container, and not fully reliant on bind mount