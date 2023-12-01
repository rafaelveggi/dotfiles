#!/bin/bash

function sudo() {
  # replace vi for nvim for convenience, otherwise executes sudo as usual
  if [[ $1 == 'vi' ]]; then
    command sudo nvim "${@:2}"
  else
    command sudo "$@"
  fi
}
