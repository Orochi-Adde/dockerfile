#!/bin/bash
set -e

if [ ! -d /root/log ]; then
  mkdir -p /root/log
fi

crond

if [ -f /root/crontab.list ]; then
  crontab /root/crontab.list
fi

if [ "${1#-}" != "${1}" ] || [ -z "$(command -v "${1}")" ]; then
  set -- python3 "$@"
fi

exec "$@"