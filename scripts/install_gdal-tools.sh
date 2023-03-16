#!/bin/sh

apk upgrade
apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/community gdal-tools
echo COMPLETE