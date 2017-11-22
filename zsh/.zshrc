# Check if neovim is installed else switch to vim
if command -v nvim > /dev/null 2>&1; then
    export EDITOR=nvim
else
    export EDITOR=vim
fi

HISTSIZE=2000
SAVEHIST=2000
HISTFILE=~/.zsh_history

bindkey -v # Vi mode bindings

setopt correct # Turn on spelling correction
setopt hist_expire_dups_first # when trimming history, lose oldest duplicates first
setopt hist_verify # don't execute, just expand history
setopt histignoredups # Don't save duplicate in history
setopt inc_append_history # Appends every command to the history file once it is executed
setopt share_history # Reloads the history whenever you use it

autoload -Uz colors && colors # Load colors
autoload -Uz compinit && compinit

# Commands matching the current line up to the current cursor position will be shown
# FIXME does not work
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search

zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "$key[Up]"   ]] && bindkey -- "$key[Up]"   up-line-or-beginning-search
[[ -n "$key[Down]" ]] && bindkey -- "$key[Down]" down-line-or-beginning-search

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

zstyle ':completion:*' menu select
zstyle ':vcs_info:git:*' formats '%b'

# Include bash_aliases
[ -f ~/.bash_aliases ] && source ~/.bash_aliases

# Extra settings for zsh
[ -f ~/.config/zsh/.zshrc_extra ] && source ~/.config/zsh/.zshrc_extra

# If found source local zshrc
[ -f ~/.config/zsh/.zshrc_local ] && source ~/.config/zsh/.zshrc_local

# Custom PROMPT for zsh
PROMPT='%{$fg_bold[yellow]%}%n@%m %{$fg_bold[green]%}%~/ %{$fg_bold[blue]%}($vcs_info_msg_0_)%{$reset_color%} $ '

source <(antibody init)
antibody bundle < ~/.config/zsh/.zsh_plugins
