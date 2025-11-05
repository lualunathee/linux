#!/usr/bin/env bash
LOG_DIR="/var/log/myapp"
LOG_FILE="${LOG_DIR}/healthcheck.log"
URL="http://127.0.0.1:8080"
TS="$(date '+%Y-%m-%d %H:%M:%S')"

sudo mkdir -p "${LOG_DIR}"
STATUS=$(curl -s -o /dev/null -w "%{http_code}" "${URL}" || echo "000")

if [[ "${STATUS}" == "200" ]]; then
  echo "${TS} OK ${STATUS}" | sudo tee -a "${LOG_FILE}" >/dev/null
else
  echo "${TS} FAIL ${STATUS}" | sudo tee -a "${LOG_FILE}" >/dev/null
fi
