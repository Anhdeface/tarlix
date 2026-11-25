# Static Bash config for Tarlix (Powerlevel10k-inspired, mobile + desktop)
[ -f "$HOME/.bashrc" ] && source "$HOME/.bashrc"

export PATH="/workspaces/tarlix/bin:$HOME/bin:$PATH"
stty erase '^?' 2>/dev/null || true

__tarlix_git_branch() {
  local dir="$PWD" head
  while [ "$dir" != "/" ] && [ -n "$dir" ]; do
    if [ -f "$dir/.git/HEAD" ]; then
      IFS= read -r head < "$dir/.git/HEAD"
      case "$head" in
        ref:\ refs/heads/*) printf '%s' "${head#ref: refs/heads/}" ;;
        *) printf '%.7s' "$head" ;;
      esac
      return
    fi
    dir="${dir%/*}"
  done
}

__tarlix_prompt() {
  local exit_code=$?
  local display_user="${GITHUB_USER:-$USER}"
  local branch
  branch=$(__tarlix_git_branch)

  local seg_user="\[\033[1;30;46m\] ${display_user}@tarlix \[\033[0m\]"
  local seg_dir="\[\033[1;37;44m\] \w \[\033[0m\]"
  local seg_git=""
  if [ -n "$branch" ]; then
    seg_git="\[\033[1;30;43m\] ${branch} \[\033[0m\]"
  fi

  local arrow
  if [ "$exit_code" -eq 0 ]; then
    arrow="\[\033[1;32m\]~>\[\033[0m\]"
  else
    arrow="\[\033[1;31m\]~>\[\033[0m\]"
  fi

  local cols="${COLUMNS:-80}"
  if [ "$cols" -lt 60 ]; then
    PS1="${seg_user}${seg_dir}${seg_git}\n${arrow} "
  else
    PS1="${seg_user}${seg_dir}${seg_git} ${arrow} "
  fi
}

PROMPT_COMMAND="__tarlix_prompt"
