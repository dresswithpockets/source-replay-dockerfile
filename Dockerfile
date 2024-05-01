# create an ubuntu webserver hosting the source-relay
FROM ubuntu:22.04
RUN apt update -y && apt upgrade -y
RUN apt install -y gettext

EXPOSE 57452
EXPOSE 8080

ARG DISCORD_TOKEN
ARG MYSQL_DB_HOST
ARG MYSQL_DB_USER
ARG MYSQL_DB_PASSWORD
ARG MYSQL_DB_PORT
ARG MYSQL_DB_DBNAME

WORKDIR /root/
COPY . .

RUN envsubst <config.toml.in >config.toml
RUN chmod +x ./server
ENTRYPOINT ./server
