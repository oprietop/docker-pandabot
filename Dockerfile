FROM python:3-alpine
MAINTAINER Oscar Prieto <oscarmpp@gmail.com>

RUN uname -a \
    # apk Packages to keep in the image
    && apk add -u --no-cache libstdc++ \
    # apk Temporal packages
    && apk add -u --no-cache --virtual .build-deps build-base libffi-dev \
    # pip packages to install
    && pip install --no-cache-dir asyncio aiohttp[speedups] pandas openpyxl pytz slackclient certifi \
    # cleaning
    && apk del --no-cache --purge .build-deps \
    && rm -rf /var/cache/apk/*
