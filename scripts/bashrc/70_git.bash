#!/usr/bin/bash

alias L="git log"
alias M="git commit --amend"
alias Ss="git status "
alias S="git status --porcelain -b "
alias A="git add -A"

function C() { git commit -m "$*"; }

function github-login() {
  local name email filename

  if [ "$#" -lt 3 ]; then
    echo "Usage: github-login <first name> <last name> <email>"
    return 1
  fi

  name="$1 $2"
  email="$3"
  filename="$(ls "$HOME"/.ssh/id_*_"${3%%@*}" 2>/dev/null)"
  if [ ! -e "$filename" ]; then
    echo "Error: Unknown user: ${name} email: ${email}"
    return 1
  fi

  eval "$(ssh-agent -s)"
  ssh-add "${filename}"

  git config --global user.name \""$name"\"
  git config --global user.email \""$email"\"
}
