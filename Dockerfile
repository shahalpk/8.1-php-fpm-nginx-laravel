FROM serversideup/php:8.1-fpm-nginx

ARG WEB_USER_ID=9999
ARG WEB_GROUP_ID=9999

ENV SSL_MODE=off \
    AUTORUN_LARAVEL_MIGRATION=false \
    AUTORUN_LARAVEL_STORAGE_LINK=false \
    PUID=9999 \
    PGID=9999


# Install git so composer can checkout repositories in need (some private packages etc..)
RUN apt-get -y update && apt-get -y install git

RUN mkdir -m 700 ~/.ssh && \
    touch -m 600 ~/.ssh/known_hosts && \
    ssh-keyscan github.com > /root/.ssh/known_hosts


COPY --chmod=755 etc/s6-overlay/ /etc/s6-overlay/
