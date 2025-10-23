#!/bin/bash

# Skript 1 – väga basic süsteemiinfo
set -Eeuo pipefail

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  echo "Kasutamine: $0 [NIMI]"
  echo "Näide: $0 Deimo"
  exit 0
fi

NIMI="${1:-}"
[[ -n "$NIMI" ]] && echo "Tere, $NIMI! 👋" || echo "Tere!"

echo "——— Süsteemi põhiinfo ———"
echo "Kuupäev/kellaaeg : $(date)"
echo "Hostinimi        : $(hostname -f 2>/dev/null || hostname)"
echo "Kernel           : $(uname -r)"
. /etc/os-release 2>/dev/null || true
[[ -n "${PRETTY_NAME:-}" ]] && echo "OS               : ${PRETTY_NAME}"
echo "Uptime           : $(uptime -p || true)"

echo
echo "——— IP-aadressid ———"
ip -4 -brief addr show 2>/dev/null | awk '{print $1, $3}'

echo
echo "——— Ketta kasutus (/) ———"
df -h -x tmpfs -x devtmpfs / | awk 'NR==2{printf "Suurus: %s  Kasutus: %s  Vaba: %s\n",$2,$5,$4}'

echo
echo "——— Võrgu kiirtest ———"
if ping -c 2 -w 4 1.1.1.1 >/dev/null 2>&1; then
  echo "Võrk OK (ping töötab)"
else
  echo "Pingi test ebaõnnestus"
fi

echo
echo "Valmis."
