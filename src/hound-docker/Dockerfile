# === base image

FROM alpine:latest

# === info

# this is a alpine based image for changemedescribe

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

COPY src/hound /app

# ensure app has executable permission
# RUN chmod +x /app/test.py
# custom permissions for project files - recursive change with +X

# === ports

# expose is useful for inter-container communication with docker. use -p when running to bind port
EXPOSE 8080

# === add helper scripts
# note - with +X recursive permissions

# default entrypoint script
# COPY ./docker-entrypoint.sh /usr/local/bin/
# RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# COPY ./docker-helper-scripts /opt/docker-helper-scripts
# RUN chmod -R +x /opt/docker-helper-scripts
# RUN chmod +x /opt/docker-helper-scripts/docker-entrypoint.sh

# alternatively copy the script needed directly into bin
# COPY ./docker-entrypoint-keepalive.sh /usr/local/bin/
# RUN chmod +x /usr/local/bin/docker-entrypoint-keepalive.sh

# === main runner

# default entrypoint
ENTRYPOINT ["tini", "--"]
# ENTRYPOINT ["/bin/sh", "-c"]

# default command
CMD ["env"]
# CMD ["docker-entrypoint-keepalive.sh"]
