" Automatic installation of vim-plug
if empty(glob('~/.vim/autoload'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin()

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-eunuch'

call plug#end()
