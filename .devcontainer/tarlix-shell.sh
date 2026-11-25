#!/usr/bin/env bash
cd /home/vscode
clear
cat << 'EOF'
========================================
  TARLIX CLOUD TERMINAL
  Du an: Tarlix
========================================
EOF
echo "User: $(whoami) | Dir: $(pwd)"
echo ""
exec zsh
