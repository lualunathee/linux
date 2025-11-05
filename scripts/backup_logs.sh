#!/usr/bin/env bash
SRC="/var/log/syslog"
DEST_DIR="/opt/backups"
TS="$(date '+%Y%m%d_%H%M%S')"
DEST_FILE="${DEST_DIR}/syslog_${TS}.tar.gz"

sudo mkdir -p "${DEST_DIR}"
if [[ -f "${SRC}" ]]; then
  sudo tar -czf "${DEST_FILE}" "${SRC}" && echo "Backup created: ${DEST_FILE}"
else
  echo "Source log not found: ${SRC}"
fi
