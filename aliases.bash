#!/usr/bin/bash

alias x="startx"
alias grep="grep --color=auto "
alias ls="ls --color=auto "
alias l="ls -lh"
alias la="ls -lhA "
alias lt="tree -L 1 "
alias cat="bat"
alias vi="nvim"
alias rc="source ~/.bashrc"
alias rmf="rm -rf "
alias top="htop "
alias y="yarn "

#sudo
alias sudo="__sudo"
alias svi="sudo nvim "
alias updatedb="sudo updatedb"
alias dmesg="sudo dmesg"
alias reboot="sudo reboot"
alias shutdown="sudo shutdown -h now"
alias zzz="sudo zzz"
function __sudo() {
    if [[ $1 == 'vi' ]]; then
        # replaces vi for nvim for convenience
        command sudo nvim "${@:2}"
    else
        command sudo "$@"
    fi
}

# git
alias L="git log "
alias M="git commit --amend "
alias S="git status "
alias Ss="git status --porcelain -b "
alias A="git add -A "
alias C="__git_commit "

function __git_commit() { git commit -m "$*"; }


#function __man() {
#    if command man "$1" &>/dev/null; then
#        command man "$1"
#    else
#    	local domain="dyn.manpages.debian.org"
#        local url="https://${domain}/bookworm/debian-goodies/${1}.1.en.gz"
#        local http_code
#	echo "Fetching manual from ${domain}"
#        if ! http_code=$(curl -s -o /dev/null -w "%{http_code}" "$url"); then
#            echo "Error fetching page"
#        elif [ "$http_code" -eq 404 ]; then
#            command man "$1"
#        else
#            curl -s "$url" | command man -l
#        fi
#    fi
#}
#alias man="__man"

