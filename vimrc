"==============================================================================
" General vim settings
"==============================================================================

let mapleader=' '

set expandtab " Tabs are spaces
set softtabstop=4 " Number of spaces in tab when editing
set tabstop=4 " Number of visual spaces per TAB
set shiftwidth=4 " Number of space insert/remove shifting line
set shiftround " Round indent to multiple of 'shiftwidth' 

set number " Shows line number
set cursorline " Highlight current line
set colorcolumn=80 " Ruler for maximum characters
set laststatus=2 " Always show status line

set ignorecase " Case insensitive search
set smartcase " Performs case sensitive search if contains uppercase letters
set hlsearch " Turn on search pattern highlighting.
set incsearch " Search as characters are entered

set foldenable " Enable folding
set foldlevelstart=10 " Open most folds by default
set foldmethod=indent " Fold based on indent level

set wildmenu " Visual autocomplete for command menu
set autoindent " Auto indent

set nowrap " Disable wrapping
set title " Change terminal title
set hidden " Enables hidden buffer
set autoread " Auto read file when modified externally

filetype plugin indent on

"==============================================================================
" Plugin list
"==============================================================================

call plug#begin('~/.vim/plugged')

Plug 'sjl/badwolf'
Plug 'altercation/vim-colors-solarized'
Plug 'tomtom/tcomment_vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
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
Plug 'xolox/vim-misc' | Plug 'xolox/vim-session'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' } | Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'benekastah/neomake'

call plug#end()

"==============================================================================
" Colorscheme
"==============================================================================

colorscheme badwolf

"==============================================================================
" Mappings
"==============================================================================
if has('nvim')
    tnoremap <A-h> <C-\><C-n><C-w>h
    tnoremap <A-j> <C-\><C-n><C-w>j
    tnoremap <A-k> <C-\><C-n><C-w>k
    tnoremap <A-l> <C-\><C-n><C-w>l
endif

nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Move line
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

"==============================================================================
" Easymotion
"==============================================================================

let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
nmap s <Plug>(easymotion-s2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

"==============================================================================
" Synstastic
"==============================================================================

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_html_tidy_exec = 'tidy5'

let g:syntastic_error_symbol = "✗"
let g:syntastic_style_error_symbol = "✠"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_style_warning_symbol = "≈"

"==============================================================================
" Airline
"==============================================================================

let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

"==============================================================================
" Flake8
"==============================================================================

let g:flake8_show_in_gutter=1

"==============================================================================
" FZF 
"==============================================================================

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Fzf layout
let g:fzf_layout = { 'down': '40%' }

" Mapping
map <C-p> :FZF<CR>
 
" Advanced customization using autoload functions
autocmd VimEnter * command! Colors
  \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'})

"==============================================================================
" vim-session
"==============================================================================

let g:session_autosave = 'yes'

"==============================================================================
" NERDTree
"==============================================================================

map <F2> :NERDTreeToggle<CR>

"==============================================================================
" Tagbar
"==============================================================================

nmap <F3> :TagbarToggle<CR>

"==============================================================================
" vim-snippet
"==============================================================================

let g:UltiSnipsExpandTrigger='<C-y>'
let g:UltiSnipsJumpForwardTrigger='<c-b>'
let g:UltiSnipsJumpBackwardTrigger='<c-z>'
