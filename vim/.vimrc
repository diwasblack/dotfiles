" Automatic installation of vim-plug
if empty(glob('~/.vim/autoload'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin()

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-eunuch'
Plug 'justinmk/vim-dirvish'
Plug 'tpope/vim-commentary'

call plug#end()

set copyindent            " Use indentation for previous line as a default
set expandtab             " Tabs are spaces
set ignorecase            " Case insensitive search
set noswapfile            " Disable swap file
set number                " Shows line number
set relativenumber        " Enable relative numbering
set shiftround            " Round indent to multiple of 'shiftwidth'
set shiftwidth=4          " Number of space insert/remove shifting line
set softtabstop=4         " Number of spaces in tab when editing
set tabstop=4             " Number of visual spaces per TAB
set undofile              " Persistent undo
