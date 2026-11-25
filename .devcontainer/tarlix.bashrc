# Static Bash config for Tarlix (Powerlevel10k-inspired, zero-write startup)
[ -f "$HOME/.bashrc" ] && source "$HOME/.bashrc"

export PATH="/workspaces/tarlix/bin:$HOME/bin:$PATH"

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
  local branch
  branch=$(__tarlix_git_branch)

  local seg_user="\[\033[1;30;46m\] \u@tarlix \[\033[0m\]"
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

  PS1="${seg_user}${seg_dir}${seg_git} ${arrow} "
}

PROMPT_COMMAND="__tarlix_prompt"
