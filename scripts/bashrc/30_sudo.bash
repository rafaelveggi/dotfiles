#!/usr/bin/env bash

function sudo() {
  if [[ $1 == 'vi' ]]; then # replace vi for nvim for convenience, otherwise executes sudo as usual
    command sudo nvim "${@:2}"
  else
    command sudo "$@"
  fi
}
