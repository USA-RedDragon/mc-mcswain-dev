FROM node:20.3-alpine as frontend

WORKDIR /app

RUN mkdir -p /app/site

COPY site/package.json site/package-lock.json /app/site/

RUN cd site && npm ci

COPY site /app/site

RUN cd site && npm run build

FROM nginx:1.25-alpine-slim

COPY --from=frontend /app/site/dist /usr/share/nginx/html
COPY init /init

EXPOSE 80
EXPOSE 443
EXPOSE 25565

ENV SERVER_IP ""
ENV SERVER_PORT ""
ENV MAP_PORT ""
ENV MAP_HOSTNAME ""

CMD ["/init"]
