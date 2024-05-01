# create an ubuntu webserver hosting the source-relay
FROM ubuntu:22.04
RUN apt update -y && apt upgrade -y
RUN apt install -y gettext

WORKDIR /root/
COPY . .

EXPOSE 57452
EXPOSE 8080

RUN envsubst <config.toml.in >config.toml
RUN chmod +x ./server
ENTRYPOINT ./server
