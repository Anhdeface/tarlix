#!/usr/bin/env bash
set -e

if ! command -v ttyd >/dev/null 2>&1; then
  sudo curl -sSL "https://github.com/tsl0922/ttyd/releases/latest/download/ttyd.$(uname -m)" -o /usr/local/bin/ttyd
  sudo chmod +x /usr/local/bin/ttyd
fi

if ! pgrep -x ttyd >/dev/null 2>&1; then
  setsid ttyd -W -p 7681 -t fontSize=16 -t disableLeaveAlert=true \
    bash -lc 'command -v tmux >/dev/null && tmux new-session -A -s main || exec zsh' \
    </dev/null >/tmp/ttyd.log 2>&1 &
fi

if [ -n "${CODESPACE_NAME:-}" ]; then
  DOMAIN="${GITHUB_CODESPACES_PORT_FORWARDING_DOMAIN:-app.github.dev}"
  echo "Tarlix Web Terminal: https://${CODESPACE_NAME}-7681.${DOMAIN}"
fi
