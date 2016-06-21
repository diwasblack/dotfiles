# Turn on spelling correction
setopt correct

# Correction for arguments
# setopt correctall

# Don't save duplicate in history
setopt histignoredups

# Vi mode bindings
bindkey -v

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

    # Theme to use
    # zgen oh-my-zsh themes/gentoo

    zgen load zsh-users/zsh-syntax-highlighting
    zgen load zsh-users/zsh-completions 

    zgen save
fi

# Custom PROMPT for zsh
PROMPT='%{$fg_bold[yellow]%}λ %{$fg_bold[green]%} %~/ $(git_prompt_info)$ %{$reset_color%}'
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=") "

# Configuration for fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Extra setting for zsh
[ -f ~/.zshrc_extra ] && source ~/.zshrc_extra

# Include bash_aliases
[ -f ~/.bash_aliases ] && source ~/.bash_aliases
