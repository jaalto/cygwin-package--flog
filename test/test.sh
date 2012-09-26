#!/bin/sh
# Test basic functionality

set -e

proram=$0
TMPDIR=${TMPDIR:-/tmp}
TMPBASE=$TMPDIR/tmp.$$
CURDIR=.

case "$0" in
  */*)
        CURDIR=${0%/*}
        ;;
esac

AtExit ()
{
    rm -f "$TMPBASE"*
}

Run ()
{
    echo "$*"
    shift
    eval "$@"
}

trap AtExit 0 1 2 3 15

# #######################################################################

file="$TMPBASE"

Run "%% TEST basic:" "echo test | flog $file"
grep test "$file"

# End of file
