# Load Antigen
source ~/dotfiles/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found

antigen bundle rupa/z

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Antigen theme
antigen theme jdavis/zsh-files themes/jdavis

# Tell antigen that you're done.
antigen apply

# Turn on spelling correction
setopt correct

# Correction for arguments
setopt correctall

# Don't save duplicate in history
setopt histignoredups

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# True color support for neovim
export NVIM_TUI_ENABLE_TRUE_COLOR=1
source "$HOME/.vim/plugged/gruvbox/gruvbox_256palette.sh"

export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3.4
export PROJECT_HOME=$HOME/Devel
source /usr/local/bin/virtualenvwrapper.sh
