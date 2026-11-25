#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if ! command -v ttyd >/dev/null 2>&1; then
  sudo curl -sSL "https://github.com/tsl0922/ttyd/releases/latest/download/ttyd.$(uname -m)" -o /usr/local/bin/ttyd
  sudo chmod +x /usr/local/bin/ttyd
fi

chmod +x "$SCRIPT_DIR/tarlix-shell.sh"

if [ "${1:-}" = "--restart" ]; then
  pkill -x ttyd >/dev/null 2>&1 || true
  sleep 0.5
fi

if ! pgrep -x ttyd >/dev/null 2>&1; then
  nohup setsid ttyd -W -p 7681 -w /home/vscode \
    -t rendererType=dom \
    -t scrollback=500 \
    -t fontSize=16 \
    -t cursorStyle=bar \
    -t disableResizeOverlay=true \
    -t disableLeaveAlert=true \
    bash "$SCRIPT_DIR/tarlix-shell.sh" \
    </dev/null >/tmp/ttyd.log 2>&1 &
  disown || true
  sleep 1
fi

if [ -n "${CODESPACE_NAME:-}" ]; then
  DOMAIN="${GITHUB_CODESPACES_PORT_FORWARDING_DOMAIN:-app.github.dev}"
  echo "Tarlix Web Terminal: https://${CODESPACE_NAME}-7681.${DOMAIN}"
fi
