FROM node:21.7.3-alpine@sha256:78c45726ea205bbe2f23889470f03b46ac988d14b6d813d095e2e9909f586f93 as frontend

WORKDIR /app

COPY package.json package-lock.json /app/

RUN npm ci

COPY . /app

RUN npm run build

FROM nginx:1.31-alpine-slim@sha256:9c68ad4f28e7dee4b9484a7859bf451da39ef661bcd038ef62e87593fcd91c86

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
