#!/bin/sh -el

[ -z "$*" ] || exec "$@"

CONFIG=${1:-/etc/davmail/davmail.properties}
if [ -n "$DAVMAIL_CONFIG_URL" ]; then
  CONFIG=$HOME/davmail.properties
  wget -qO $CONFIG "$DAVMAIL_CONFIG_URL"
elif [ -n "$DAVMAIL_URL" ]; then
  CONFIG=$HOME/davmail.properties
  while read line; do
    eval echo "$line"
  done < /etc/davmail/davmail.properties.template > $CONFIG
fi

if [ -n "$DAVMAIL_SSL_PASS" ]; then
  if [ ! -r /etc/davmail/davmail.p12 ] || [ ! -s /etc/davmail/davmail.p12 ]; then
    echo "ERROR: can't read ssl keystore [/etc/davmail/davmail.p12]!"
    return 2
  fi
fi

if [ -z "$DAVMAIL_SSL_PASS" ] || [ ! -s /etc/davmail/davmail.p12 ]

if [ -r "$CONFIG" ]; then
  exec /opt/davmail/davmail.sh "$CONFIG"
else
  echo "ERROR: can't read [$CONFIG]!"
  return 1
fi
