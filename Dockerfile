# create an ubuntu webserver hosting the source-relay
FROM ubuntu:22.04
RUN apk --no-cache add ca-certificates

WORKDIR /root/
COPY . .

EXPOSE 57452
EXPOSE 8080

RUN envsubst <config.toml.in >config.toml
CMD ["server"]
