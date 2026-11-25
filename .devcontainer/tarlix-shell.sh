#!/usr/bin/env bash
chmod +x /workspaces/tarlix/bin/* 2>/dev/null || true
export PATH="/workspaces/tarlix/bin:$HOME/bin:$PATH"
export SHELL="/bin/bash"
cd /home/vscode
clear
if [ -f /workspaces/tarlix/bin/tarlixfetch ]; then
  bash /workspaces/tarlix/bin/tarlixfetch
fi
exec /bin/bash
