#!/usr/bin/env bash
find /workspaces/tarlix/bin -type f ! -executable -exec chmod +x {} + 2>/dev/null || true
export PATH="/workspaces/tarlix/bin:$HOME/bin:$PATH"
export SHELL="/bin/bash"
cd /home/vscode
clear
[ -f /workspaces/tarlix/bin/tarlixfetch ] && bash /workspaces/tarlix/bin/tarlixfetch
exec /bin/bash --rcfile /workspaces/tarlix/.devcontainer/tarlix.bashrc
