#!/usr/bin/env bash
set -e

if pgrep -x ttyd >/dev/null 2>&1; then
  exit 0
fi

if ttyd --help 2>&1 | grep -q -- '--writable'; then
  nohup ttyd -W -p 7681 tmux new-session -A -s main >/tmp/ttyd.log 2>&1 &
else
  nohup ttyd -p 7681 tmux new-session -A -s main >/tmp/ttyd.log 2>&1 &
fi
