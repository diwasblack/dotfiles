# Check if neovim is installed else switch to vim
if command -v nvim > /dev/null 2>&1; then
    export EDITOR=nvim
    export VISUAL=nvim
else
    export EDITOR=vim
    export VISUAL=vim
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

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

zstyle ':completion:*' menu select
zstyle ':vcs_info:git:*' formats '%b'

# Add basic configurations
alias ll="ls -alFh"
alias ls="ls -G"

# Include aliases
[ -f ~/.bash_aliases ] && source ~/.bash_aliases

# Source local zshrc
[ -f ~/.zshrc_local ] && source ~/.zshrc_local

# Custom PROMPT for zsh
PROMPT='%{$fg_bold[yellow]%}%n@%m %{$fg_bold[green]%}%~/ %{$fg_bold[blue]%}($vcs_info_msg_0_)%{$reset_color%} $ '

function attach-or-create-tmux-session() {
    local project_path=$1

    # Obtain the session name to use
    local name=$(basename $project_path)

    # Check if session exists-stores status in exit code
    tmux has-session -t $name
    local tmux_status=$?

    # Attach and return if the session is present
    if [ "${tmux_status}" = "0" ]; then
        echo "Session found"
        tmux attach-session -t $name
        return
    fi

    # Create new session
    tmux new-session -d -c $project_path -s $name
    tmux send-keys "nvim -S ~/.vim_sessions/${name}" C-m
    tmux rename-window -t $name:1 'nvim'

    # Open zsh windows
    tmux new-window -a -c $project_path -t $name:1 -n "zsh1"
    tmux new-window -a -c $project_path -t $name:2 -n "zsh2"

    # Open ranger
    tmux new-window -a -c $project_path -t $name:3 -n "ranger"
    tmux send-keys "ranger" C-m

    # Focus on editor window
    tmux select-window -t $name:1

    # Attach the tmux session created
    tmux attach-session -t $name
}

alias tmuxf="attach-or-create-tmux-session"
