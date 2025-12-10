#!/bin/bash
# export_journal.sh — экспорт журнала в JSONL
OUT="/tmp/journal_export.jsonl"
FILTER=""

while [[ $# -gt 0 ]]; do
    case $1 in
        --unit)   FILTER+=" -u $2"; shift ;;
        --since)  FILTER+=" --since $2"; shift ;;
        --out)    OUT="$2"; shift ;;
        *) echo "Unknown parameter: $1"; exit 1 ;;
    esac
    shift
done

echo "Экспорт журнала → $OUT"
journalctl -o json $FILTER > "$OUT"
echo "Готово!"
