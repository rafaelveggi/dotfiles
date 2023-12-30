#!/usr/bin/env bash

function set_prompt_colors() {
  local color last_commit_msg status reset

  reset="\[\e[0m\]"
  status="$(git status --porcelain -b 2>/dev/null)"

  if [ ! "$status" ]; then
    color="\[\e[1;96m\]"
    PS1="${color}\u@\w\$${reset} "
    return
  fi

  case "$status" in
  *"behind"* | *"no branch"*)
    color="\[\e[1;41m\]" # red
    ;;
  *"ahead"* | *"M "* | *"A "* | *"?? "* | *"No commits yet on "*)
    color="\[\e[1;33m\]" # yellow
    ;;
  *)
    color="\[\e[1;32m\]" # green
    ;;
  esac
  last_commit_msg="$(git log -i --pretty=%B | head -n 1)"

  PS1="\u@\h${color}[\w]${reset} [${last_commit_msg}]\n\$ "
}

PROMPT_COMMAND="set_prompt_colors"
