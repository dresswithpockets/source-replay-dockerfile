# create an ubuntu webserver hosting the source-relay
FROM ubuntu:22.04
RUN apk --no-cache add ca-certificates
WORKDIR /root/
# The build context is set to the directory where the repo is cloned.
# This will copy all files in the repo to /app inside the container.
# If your app requires the build context to be set to a subdirectory inside the repo, you
#   can use the source_dir app spec option, see: https://www.digitalocean.com/docs/app-platform/references/app-specification-reference/
COPY . .
CMD ["server"]

# -- Stage 2 -- #
# Create the final environment with the compiled binary.
FROM alpine
# Install any required dependencies.
RUN apk --no-cache add ca-certificates
WORKDIR /root/
# Copy the binary from the builder stage and set it as the default command.
COPY --from=builder /app/bin/hello /usr/local/bin/
CMD ["hello"]
