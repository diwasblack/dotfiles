"==============================================================================
" General vim settings
"==============================================================================

let mapleader=' '

" Set encoding at startup
if has('vim_starting')
    set encoding=utf-8
endif

set autoindent                 " Auto indent
set autoread                   " Auto read file when modified externally
set backspace=indent,eol,start " Backspace through everything
set colorcolumn=80             " Ruler for maximum characters
set complete-=i                " Don't search included files
set cursorline                 " Highlight current line
set display+=lastline          " Display as much as possible content of last line
set expandtab                  " Tabs are spaces
set foldenable                 " Enable folding
set foldlevelstart=10          " Open most folds by default
set foldmethod=indent          " Fold based on indent level
set formatoptions="tcqj"       " Settings for automatic formatting
set hidden                     " Enables hidden buffer
set history=1000               " Max history to remember
set hlsearch                   " Turn on search pattern highlighting
set ignorecase                 " Case insensitive search
set incsearch                  " Search as characters are entered
set laststatus=2               " Always show status line
set lazyredraw                 " Redraw only when we need to
set list                       " Show invisible characters
set noswapfile                 " Disable swap file
set nowrap                     " Disable wrapping
set number                     " Shows line number
set sessionoptions-=options    " Don't store options in sessions
set shiftround                 " Round indent to multiple of 'shiftwidth'
set shiftwidth=4               " Number of space insert/remove shifting line
set smartcase                  " Performs case sensitive search if contains uppercase letters
set smartindent                " Smart indentation
set softtabstop=4              " Number of spaces in tab when editing
set splitright                 " New windows goes right
set tabpagemax=50              " Maximux number of tab pages to be opened from command
set tabstop=4                  " Number of visual spaces per TAB
set title                      " Change terminal title
set ttyfast                    " Optimize for fast terminal connections
set wildmenu                   " Visual autocomplete for command menu

if !empty(&viminfo)
  set viminfo^=!
endif

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
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'majutsushi/tagbar'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'nvie/vim-flake8'
Plug 'xolox/vim-misc' | Plug 'xolox/vim-session'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'mhinz/vim-startify'
call plug#end()

"==============================================================================
" Colorscheme
"==============================================================================

set t_Co=256
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
xnoremap <C-j> :m '>+1<CR>gv=gv
xnoremap <C-k> :m '<-2<CR>gv=gv
xnoremap <C-h> <gv
xnoremap <C-l> >gv
nnoremap <C-h> <<
nnoremap <C-l> >>
xnoremap < <gv
xnoremap > >gv

" Mapping to switch buffers
nnoremap gb :bnext<CR>
nnoremap gB :bprevious<CR>

nnoremap <leader>q :q<CR>
if has('nvim')
    tnoremap <leader>q <C-\><C-n>:q<CR>
endif

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

" Show buffer list at top
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

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
nnoremap <C-p> :Files<CR>
nnoremap <Leader>b :Buffers<CR>

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
" undotree
"==============================================================================

nmap <F3> :UndotreeToggle<CR>

"==============================================================================
" Tagbar
"==============================================================================

nmap <F10> :TagbarToggle<CR>

"==============================================================================
" vim-snippet
"==============================================================================

let g:UltiSnipsExpandTrigger='<C-y>'
let g:UltiSnipsJumpForwardTrigger='<c-b>'
let g:UltiSnipsJumpBackwardTrigger='<c-z>'

"==============================================================================
" vim-easy-align
"==============================================================================

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"==============================================================================
" startify
"==============================================================================

let g:startify_custom_header =
    \ map(split(system('fortune | cowsay'), '\n'), '"   ". v:val') + ['','']
