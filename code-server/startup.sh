#!/bin/bash
# Need to save variable under .env
# ID=$(curl 169.254.169.254/latest/meta-data/instance-id)
docker-compose up -d
sleep 30
docker exec -it nginx-reverse-proxy openssl req -x509 -nodes -days 1095 -newkey rsa:2048 -keyout /etc/ssl/private/self-signed-key.pem -out /etc/ssl/certs/self-signed-crt.pem -subj "/C=US/ST=Any/L=Anytown/O=decyphertek-io/OU=adminotaur/CN=decyphertek"
docker exec -it nginx-reverse-proxy nginx -s reload