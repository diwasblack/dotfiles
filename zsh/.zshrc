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

setopt correct
setopt hist_expire_dups_first
setopt hist_verify
setopt histignoredups
setopt inc_append_history
setopt share_history
setopt prompt_subst

# Load colors
autoload -Uz colors && colors
autoload -Uz compinit && compinit

zstyle ':completion:*' menu select

# Add basic configurations
alias ll="ls -alFh"
alias ls="ls -G"

# Source important configs
[ -f ~/.bash_aliases ] && source ~/.bash_aliases
[ -f ~/.zshrc_local ] && source ~/.zshrc_local

# Custom PROMPT for zsh
PROMPT='%{$fg_bold[yellow]%}%n@%m %{$fg_bold[green]%}%c/%{$reset_color%} $ '
