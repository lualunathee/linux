#!/bin/bash
# journal_watch.sh - поиск по журналу с контекстом
PATTERN="$1"
SINCE="--since=1h"
LINES=50

while [[ $# -gt 0 ]]; do
    case "$1" in
        --since=*) SINCE="$1" ;;
        --lines=*) LINES="${1#--lines=}" ;;
        *) PATTERN="$1" ;;
    esac
    shift
done

if [ -z "$PATTERN" ]; then
    echo "Usage: $0 \"pattern\" [--since=\"1 hour ago\"] [--lines=100]"
    exit 1
fi

journalctl -o short-iso $SINCE -n $LINES | grep -i --color=always -E "$PATTERN" || true
