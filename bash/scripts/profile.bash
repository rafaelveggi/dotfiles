#!/bin/bash

export N_PREFIX=/home/raf/.n
export PATH=$N_PREFIX/bin:/home/raf/.local/bin:$PATH

export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH

if [[ -f "${HOME}/.bashrc" ]]; then
  # shellcheck disable=SC1091
  source "${HOME}/.bashrc"
fi
