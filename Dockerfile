FROM node:21.7.3-alpine as frontend

WORKDIR /app

COPY package.json package-lock.json /app/

RUN npm ci

COPY . /app

RUN npm run build

FROM nginx:1.31-alpine-slim@sha256:f45171d36c76a8b2f5ef97108a3a8a2294248a6578a0a180edc2d78f7d2edc26

COPY --from=frontend /app/dist /usr/share/nginx/html

RUN <<__DOCKER__

cat <<EOF > /etc/nginx/conf.d/default.conf
server {
    listen 80;
    server_name localhost;
    root /usr/share/nginx/html;
    index index.html;
    location / {
        try_files \$uri \$uri/ /index.html;
    }
}
EOF
__DOCKER__

EXPOSE 80
