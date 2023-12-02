#!/bin/bash

# PS1='[\u@\h \W]\$ '

function set_prompt_colors() {
  local color
  local reset="\[\e[0m\]"

  local status

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

  PS1="\u@\h${color}[\w]${reset}\n\$ "
}

PROMPT_COMMAND="set_prompt_colors"
