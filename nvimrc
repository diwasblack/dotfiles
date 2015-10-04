colorscheme badwolf

" General vim settings

filetype plugin indent on

set expandtab "tabs are spaces
set softtabstop=4 "number of spaces in tab when editing
set tabstop=4 "number of visual spaces per TAB
set shiftwidth=4 "number of space insert/remove shifting line

set number "shows line number
set cursorline "highlight current line
set colorcolumn=80 "ruler for maximum characters
set laststatus=2 "always show status line

set ignorecase "case insensitive search
set smartcase "performs case sensitive search if search contains uppercase letters
set hlsearch "turn on search pattern highlighting.
set incsearch "search as characters are entered

set foldenable "enable folding
set foldlevelstart=10 "open most folds by default
set foldmethod=indent "fold based on indent level

set wildmenu "visual autocomplete for command menu
set autoindent "auto indent

set nowrap "disable wrapping

" Plugin list

call plug#begin('~/.vim/plugged')

Plug 'tomtom/tcomment_vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'bling/vim-airline'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'majutsushi/tagbar'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'nvie/vim-flake8'
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'

call plug#end()


" Settings for plugins

" Synstastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Airline
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" Flake8
let g:flake8_show_in_gutter=1

" FZF 
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
let g:fzf_layout = { 'down': '40%' }

" Advanced customization using autoload functions
autocmd VimEnter * command! Colors
  \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'})


" Mapping to use

:tnoremap <A-h> <C-\><C-n><C-w>h
:tnoremap <A-j> <C-\><C-n><C-w>j
:tnoremap <A-k> <C-\><C-n><C-w>k
:tnoremap <A-l> <C-\><C-n><C-w>l
:nnoremap <A-h> <C-w>h
:nnoremap <A-j> <C-w>j
:nnoremap <A-k> <C-w>k
:nnoremap <A-l> <C-w>l

" NERDTree
map <C-n> :NERDTreeToggle<CR>

" Tagbar
nmap <C-t> :TagbarToggle<CR>

" Snippets
let g:UltiSnipsExpandTrigger="<Enter>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" vim-session
let g:session_autosave = 'yes'

" FZF mapping
map <C-p> :FZF<CR>


" Autocmd