FROM node:20.3-alpine as frontend

WORKDIR /app

RUN mkdir -p /app/site

COPY site/package.json site/package-lock.json /app/site/

RUN cd site && npm ci

COPY site /app/site

RUN cd site && npm run build

FROM nginx:1.25-alpine-slim

COPY --from=frontend /app/site/dist /usr/share/nginx/html

RUN <<__EODOCKER__

cat <<EOF > /etc/nginx/conf.d/default.conf
server {
    listen 80;
    server_name _;
    root /usr/share/nginx/html;
    index index.html index.htm;
    location / {
        try_files \$uri \$uri/ /index.html;
    }
    location /health {
        return 200;
    }
}
server {
    listen 80;
    server_name dynmap.mc.mcswain.dev;
    index index.html index.htm;
    location / {
        proxy_pass http://104.128.51.81:8004;
        proxy_redirect off;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        break;
    }
}
EOF
__EODOCKER__

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
