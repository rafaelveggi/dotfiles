stty -ixon

if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

source /home/raf/dotfiles/history
source /home/raf/dotfiles/prompt
source /home/raf/dotfiles/aliases
source /home/raf/dotfiles/xbps-mgmt
source /home/raf/dotfiles/keyboard

eval "$(ssh-agent -s)" &> /dev/null
ssh-add ~/.ssh/comparis_ed25519 &> /dev/null
