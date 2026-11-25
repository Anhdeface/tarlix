#!/usr/bin/env bash
export PATH="/workspaces/tarlix/bin:$HOME/bin:$PATH"
export SHELL="/bin/bash"
cd /home/vscode
clear
if command -v tarlixfetch >/dev/null 2>&1; then
  tarlixfetch
fi
exec /bin/bash
