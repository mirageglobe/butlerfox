FROM debian:stable-slim

RUN apt-get update -q \
  && apt-get install -y --no-install-recommends ca-certificates curl bash bats shellcheck \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app
