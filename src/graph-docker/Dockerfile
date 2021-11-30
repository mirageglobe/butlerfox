# === base image

FROM debian:bullseye-slim

# debian 12 bookworm
# debian 11 bullseye
# debian 10 buster
# debian 9  stretch

# === info

# this is a debian based image for changemedescribe

# === labels

ARG BUILD_DATE=0000-00-00
ARG VCS_REF=00000000

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-url="https://github.com/mirageglobe/butlerfox.git" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.schema-version="1.0" \
      org.label-schema.name="butlerfox-graph-debian-11" \
      org.label-schema.description="image of butlerfox:graph on debian" \
      org.label-schema.url="https://github.com/mirageglobe/butlerfox"

# === define apps and dependencies

ENV \
  TERM=xterm \
  APPS=" \
        bash \
        fd-find \
        libgraph-easy-perl \
        python3 \
        ripgrep \
        tree \
        vim" \
  DEPS=" \
        apt-utils \
        build-essential \
        curl \
        make \
        tini \
        wget" \
  DEBIAN_FRONTEND=noninteractive

# update and upgrade all
RUN apt upgrade -y

# update and add build dependencies
RUN apt update && apt install -y --no-install-recommends $DEPS

# update and add runtime dependencies
RUN apt update && apt install -y --no-install-recommends $APPS

# set container working directory
WORKDIR /app

# === main runner

# default entrypoint
ENTRYPOINT ["tini", "--", "graph-easy"]
# ENTRYPOINT ["/bin/sh", "-c"]

# default command
CMD ["--help"]
# CMD ["docker-entrypoint-keepalive.sh"]
