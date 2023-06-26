#!/bin/bash

apt-get -o DPkg::Lock::Timeout=60 -o DPkg::Lock::Frontend=noninteractive update -y
apt-get -o DPkg::Lock::Timeout=60 -o DPkg::Lock::Frontend=noninteractive upgrade -y
apt-get -o DPkg::Lock::Timeout=60 -o DPkg::Lock::Frontend=noninteractive install -y docker.io

usermod -aG docker ubuntu

docker run -d \
    -e SERVER_IP=${server_ip} \
    -e SERVER_PORT=${server_minecraft_port} \
    -e MAP_PORT=${server_map_port} \
    -e MAP_HOSTNAME=${map_hostname} \
    -e SITE_HOSTNAME=${hostname} \
    -e ACME_EMAIL=${acme_email} \
    -e CLOUDFLARE_API_TOKEN=${cloudflare_api_token} \
    -p 80:80 \
    -p 443:443 \
    -p 25565:25565 \
    -p ${server_minecraft_port}:${server_minecraft_port} \
    -v /etc/letsencrypt:/etc/letsencrypt \
    --name mc-server-site \
    --restart unless-stopped \
    ${docker_image}

# now install containrrr/watchtower to always keep the docker image up to date
docker run -d \
    --name watchtower \
    -v /var/run/docker.sock:/var/run/docker.sock \
    containrrr/watchtower \
    --cleanup \
    --interval 60 \
    mc-server-site \
    watchtower
