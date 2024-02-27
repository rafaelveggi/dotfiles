source ~/dotfiles/utils.bash

function __git_commit() { git commit -m "$*"; }

function __sudo() {
    if [[ $1 == 'vi' ]]; then
        # replaces vi for nvim for convenience
        command sudo nvim "${@:2}"
    else
        command sudo "$@"
    fi
}

function __man() {
    if command man "$1" &>/dev/null; then
        command man "$1"
    else
    	local domain="dyn.manpages.debian.org"
        local url="https://${domain}/bookworm/debian-goodies/${1}.1.en.gz"
        local http_code
	echo "Fetching manual from ${domain}"
        if ! http_code=$(curl -s -o /dev/null -w "%{http_code}" "$url"); then
            echo "Error fetching page"
        elif [ "$http_code" -eq 404 ]; then
            command man "$1"
        else
            curl -s "$url" | command man -l
        fi
    fi
}

alias cat="bat"
alias ls="lsd -lh"
alias l="lsd -lhA "
alias lt="lsd --tree "
alias reboot="sudo reboot"
alias shutdown="sudo shutdown -h now"
alias vi="nvim"
alias svi="sudo nvim "
alias x="startx"
alias rc="source ~/.bashrc"
alias rmf="rm -rf "
alias top="htop "
alias updatedb="sudo updatedb"

alias L="git log "
alias M="git commit --amend "
alias S="git status "
alias Ss="git status --porcelain -b "
alias A="git add -A "
alias C="__git_commit "

alias dmesg="sudo dmesg"

alias nrd="npm run dev"
alias nrs="npm run serve"

alias sudo="__sudo"
alias man="__man"
