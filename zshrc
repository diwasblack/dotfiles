source ~/dotfiles/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo .
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle command-not-found
antigen bundle rupa/z

# Syntax highlighting bundle.
# antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme gentoo

# Tell antigen that you're done.
antigen apply

# Turn on spelling correction
setopt correct

# Correction for arguments
# setopt correctall

# Don't save duplicate in history
setopt histignoredups

export EDITOR=nvim

# Vi mode bindings
bindkey -v

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Fix for 256 color terminal
gruvbox_file="$HOME/.vim/plugged/gruvbox/gruvbox_256palette.sh"
[ -f $gruvbox_file ] && source $gruvbox_file

# Completion for mux command
[ -f ~/dotfiles/tmuxinator.zsh ] && source ~/dotfiles/tmuxinator.zsh

[ -f ~/.zshrc_extra ] && source ~/.zshrc_extra
