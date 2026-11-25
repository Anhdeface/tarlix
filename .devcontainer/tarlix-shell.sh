#!/usr/bin/env bash
cd "$HOME"
clear
cat << 'EOF'
========================================
  TARLIX CLOUD TERMINAL
  Du an: Tarlix
========================================
EOF
echo "User: $(whoami) | Dir: $(pwd)"
echo ""
exec zsh -l
