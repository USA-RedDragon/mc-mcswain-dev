FROM node:20.8-alpine as frontend

WORKDIR /app

COPY package.json package-lock.json /app/

RUN npm ci

COPY . /app

RUN npm run build

FROM nginx:1.25-alpine-slim

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
