#!/bin/bash
SERVICE="$1"
LINES="${2:-200}"

if [ -z "$SERVICE" ]; then
    echo "Usage: $0 <service_name> [lines]"
    exit 1
fi

journalctl -u "$SERVICE" --no-pager -n "$LINES"
