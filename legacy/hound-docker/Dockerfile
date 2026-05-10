# === base image

FROM alpine:latest

# === info

# this is a alpine based image for butlerfox hound project.

# === labels

ARG BUILD_DATE=0000-00-00
ARG VCS_REF=00000000

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-url="https://github.com/mirageglobe/butlerfox.git" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.schema-version="1.0" \
      org.label-schema.name="butlerfox-hound-alpine" \
      org.label-schema.description="image of butlerfox-hound on alpine" \
      org.label-schema.url="https://github.com/mirageglobe/butlerfox"

# === define apps and dependencies

ENV \
  TERM=xterm \
  APPS=" \
        bash \
        fd \
        python3 \
        ripgrep \
        tree \
        vim" \
  DEPS=" \
        alpine-sdk \
        curl \
        make \
        tini \
        python3 \
        wget"

# update and add build dependencies
RUN apk add --no-cache --update $DEPS

# update and add runtime dependencies
RUN apk add --update $APPS

# set container working directory
WORKDIR /app

# COPY src/hound /app

# === main runner

# default entrypoint
ENTRYPOINT ["tini", "--"]

# default command
CMD ["env"]
