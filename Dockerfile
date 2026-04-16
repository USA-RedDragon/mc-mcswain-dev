FROM node:21.7.3-alpine as frontend

WORKDIR /app

COPY package.json package-lock.json /app/

RUN npm ci

COPY . /app

RUN npm run build

FROM nginx:1.29-alpine-slim@sha256:c9366b8c560169b101ca0e5422ed063b20779e6454c2326b9c9704225c9b0c08

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
