# Set default text editor
export EDITOR=vim
export VISUAL=vim
if command -v nvim > /dev/null 2>&1; then
    export EDITOR=nvim
    export VISUAL=nvim
fi

HISTSIZE=2000
SAVEHIST=2000
HISTFILE=~/.zsh_history

# Vi mode bindings
bindkey -v

# Turn on spelling correction
setopt correct
# when trimming history, lose oldest duplicates first
setopt hist_expire_dups_first 
# don't execute, just expand history
setopt hist_verify
# Don't save duplicate in history
setopt histignoredups
# Appends every command to the history file once it is executed
setopt inc_append_history
# Reloads the history whenever you use it
setopt share_history

# Load colors
autoload -Uz colors && colors
autoload -Uz compinit && compinit

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

zstyle ':completion:*' menu select
zstyle ':vcs_info:git:*' formats '%b'

# Add basic configurations
alias ll="ls -alFh"
alias ls="ls -G"

# Source important configs
[ -f ~/.bash_aliases ] && source ~/.bash_aliases
[ -f ~/.zshrc_local ] && source ~/.zshrc_local

# Custom PROMPT for zsh
PROMPT='%{$fg_bold[yellow]%}%n@%m %{$fg_bold[green]%}%~/ %{$fg_bold[blue]%}($vcs_info_msg_0_)%{$reset_color%} $ '
