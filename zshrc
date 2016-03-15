# Turn on spelling correction
setopt correct

# Correction for arguments
# setopt correctall

# Don't save duplicate in history
setopt histignoredups

# Vi mode bindings
bindkey -v

# tmux plugin settings
# This always starts tmux
ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOSTART_ONCE=true
ZSH_TMUX_AUTOCONNECT=false
ZSH_TMUX_FIXTERM=true
ZSH_TMUX_AUTOQUIT=false

# Default editor to use
export EDITOR=nvim

# load zgen
source "${HOME}/dotfiles/zgen/zgen.zsh"

# check if there's no init script
if ! zgen saved; then
    echo "Creating a zgen save"

    # Load oh-my-zsh library
    zgen oh-my-zsh

    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/pip
    zgen oh-my-zsh plugins/sudo
    zgen oh-my-zsh plugins/command-not-found
    zgen oh-my-zsh plugins/tmuxinator
    zgen oh-my-zsh plugins/tmux

    # zgen load zsh-users/zsh-syntax-highlighting

    zgen load rupa/z

    # Theme
    zgen oh-my-zsh themes/gentoo

    zgen save
fi

# Configuration for fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Fix for 256 color terminal
gruvbox_file="$HOME/.vim/plugged/gruvbox/gruvbox_256palette.sh"
[ -f $gruvbox_file ] && source $gruvbox_file

[ -f ~/.zshrc_extra ] && source ~/.zshrc_extra
