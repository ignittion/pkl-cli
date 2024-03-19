#!/bin/sh

isCommand() {
  if [ "$1" = "sh" ]; then
    return 1
  fi

  pkl help --no-interaction "$1" > /dev/null 2>&1
}

# check if the first argument passed in looks like a flag
if [ "${1#-}" != "$1" ]; then
  set -- /sbin/tini -- pkl "$@"
# check if the first argument passed in is pkl
elif [ "$1" = 'pkl' ]; then
  set -- /sbin/tini -- "$@"
# check if the first argument passed in matches a known command
elif isCommand "$1"; then
  set -- /sbin/tini -- pkl "$@"
fi

exec "$@"
