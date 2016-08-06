# Default editor to use
EDITOR=nvim

HISTSIZE=2000
SAVEHIST=2000
HISTFILE=~/.zsh_history

# Turn on spelling correction
setopt correct

# Correction for arguments
# setopt correctall

# Appends every command to the history file once it is executed
setopt inc_append_history

# Reloads the history whenever you use it
setopt share_history

# Don't save duplicate in history
setopt histignoredups

# Vi mode bindings
bindkey -v

# load zgen
source "${HOME}/dotfiles/zgen/zgen.zsh"

# check if there's no init script
if ! zgen saved; then
    echo "Creating a zgen save"

    zgen load zsh-users/zsh-syntax-highlighting
    zgen load zsh-users/zsh-completions

    zgen load olivierverdier/zsh-git-prompt

    zgen save
fi

autoload -Uz compinit && compinit
zstyle ':completion:*' menu select

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "${key[Up]}"   ]] && bindkey "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey "${key[Down]}" down-line-or-beginning-search

[[ -e /etc/zsh_command_not_found ]] && source /etc/zsh_command_not_found

# Custom PROMPT for zsh
PROMPT='%{$fg_bold[yellow]%}λ %{$fg_bold[green]%} %~/ %{$reset_color%}$(git_super_status)$ %{$reset_color%}'

# Configuration for fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Extra setting for zsh
[ -f ~/.zshrc_extra ] && source ~/.zshrc_extra

# Include bash_aliases
[ -f ~/.bash_aliases ] && source ~/.bash_aliases
