# Path to oh-my-zsh installation.
export ZSH=$HOME/dotfiles/oh-my-zsh

# Name of the theme to load.
ZSH_THEME="gentoo"

# List of plugins
plugins=(git pip django command-not-found)

source $ZSH/oh-my-zsh.sh

# Turn on spelling correction
setopt correct

# Correction for arguments
# setopt correctall

# Don't save duplicate in history
setopt histignoredups

export EDITOR=nvim

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Fix for 256 color terminal
gruvbox_file="$HOME/.vim/plugged/gruvbox/gruvbox_256palette.sh"
[ -f $gruvbox_file ] && source $gruvbox_file

# Completion for mux command
[ -f ~/dotfiles/tmuxinator.zsh ] && source ~/dotfiles/tmuxinator.zsh

[ -f ~/.zshrc_extra ] && source ~/.zshrc_extra
