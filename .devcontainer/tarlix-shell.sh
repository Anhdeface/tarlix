#!/usr/bin/env bash
chmod +x /workspaces/tarlix/bin/* 2>/dev/null || true
export PATH="/workspaces/tarlix/bin:$HOME/bin:$PATH"
export SHELL="/bin/bash"
cd /home/vscode
clear
if [ -f /workspaces/tarlix/bin/tarlixfetch ]; then
  bash /workspaces/tarlix/bin/tarlixfetch
fi

cat << 'EOF' > /tmp/tarlix-bashrc
[ -f "$HOME/.bashrc" ] && source "$HOME/.bashrc"
export PATH="/workspaces/tarlix/bin:$HOME/bin:$PATH"
PS1='\[\033[1;36m\]\u@tarlix\[\033[0m\] \[\033[90m\]-\[\033[0m\] \[\033[1;34m\]\w\[\033[0m\] \[\033[1;32m\]~>\[\033[0m\] '
EOF

exec /bin/bash --rcfile /tmp/tarlix-bashrc
