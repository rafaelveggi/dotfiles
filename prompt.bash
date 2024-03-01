function set_prompt_colors() {
  local color branch last_commit_msg status reset

  reset="\[\e[0m\]"
  status="$(git status --porcelain -b 2>/dev/null)"

  if [ ! "$status" ]; then
    color="\[\e[1;96m\]"
    PS1="${color}󰜈 \u@\w\$${reset} "
    return
  fi

  branch="$(git branch | cut -d " " -f 2)"

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

  PS1="${color} ${reset}\u@\h[\w]${color} ${branch}${reset} : ${last_commit_msg}\n\$ "
}

PROMPT_COMMAND="set_prompt_colors"
