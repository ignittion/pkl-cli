#!/bin/sh

# check if the first argument passed in looks like a flag
if [ "${1#-}" != "$1" ]; then
    set -- /sbin/tini -- pkl "$@"
# check if the first argument passed in is pkl
elif [ "$1" = 'pkl' ]; then
    set -- /sbin/tini -- "$@"
# check if the first argument passed in matches a known command
elif [ "$1" = 'eval' ] ||
    [ "$1" = 'repl' ] ||
    [ "$1" = 'server' ] ||
    [ "$1" = 'test' ] ||
    [ "$1" = 'project' ] ||
    [ "$1" = 'download-package' ];
then
    set -- /sbin/tini -- pkl "$@"
fi

exec "$@"
