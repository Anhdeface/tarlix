# Tarlix Shortcuts & Aliases Registry
# Add new aliases/functions here and register them in TARLIX_ALIAS_MAP.
# Both tarlix.bashrc and alitarlix read from this single file.

TARLIX_ALIAS_MAP=(
  "cd <dir>|j <dir>"
  "cd ~|j h"
  "cd /workspaces/tarlix|j w"
  "cd -|j -"
  "cd (fzf)|j f"
  "clear|c"
)

# --- Aliases ---
alias c='clear'

# --- Functions ---
j() {
  case "${1:-}" in
    ""|"h") cd "$HOME" || return ;;
    "w")    cd /workspaces/tarlix || return ;;
    "f")
      local target
      target=$(find . -maxdepth 4 -type d -not -path '*/.*' 2>/dev/null | sed 's|^\./||' | sort | fzf)
      [ -n "$target" ] && cd "$target"
      ;;
    *)      cd "$@" || return ;;
  esac
}
