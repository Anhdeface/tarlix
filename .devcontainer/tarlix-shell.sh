#!/usr/bin/env bash
[ ! -x /workspaces/tarlix/bin/tarlixfetch ] && chmod +x /workspaces/tarlix/bin/* 2>/dev/null || true
export PATH="/workspaces/tarlix/bin:$HOME/bin:$PATH"
export SHELL="/bin/bash"
cd /home/vscode
clear
[ -f /workspaces/tarlix/bin/tarlixfetch ] && bash /workspaces/tarlix/bin/tarlixfetch
exec /bin/bash --rcfile /workspaces/tarlix/.devcontainer/tarlix.bashrc
