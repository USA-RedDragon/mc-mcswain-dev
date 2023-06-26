FROM node:20.3-alpine as frontend

WORKDIR /app

RUN mkdir -p /app/site

COPY site/package.json site/package-lock.json /app/site/

RUN cd site && npm ci

COPY site /app/site

RUN cd site && npm run build

FROM nginx:1.25-alpine-slim

RUN apk add --no-cache python3 py3-pip openssl ca-certificates s6
RUN pip3 install certbot certbot-nginx certbot-dns-cloudflare

COPY --from=frontend /app/site/dist /usr/share/nginx/html
COPY rootfs /
RUN chmod a+x /init

EXPOSE 80
EXPOSE 443
EXPOSE 25565

ENV SERVER_IP ""
ENV SERVER_PORT ""
ENV MAP_PORT ""
ENV MAP_HOSTNAME ""
ENV SITE_HOSTNAME ""
ENV ACME_EMAIL ""
ENV CLOUDFLARE_API_TOKEN ""

CMD ["/init"]
