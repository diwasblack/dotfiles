"==============================================================================
" General vim settings
"==============================================================================

let mapleader=' '
let maplocalleader=' '
let g:python3_host_prog='/usr/bin/python3'

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
set diffopt+=vertical          " Use vertical splits
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
set relativenumber             " Enable relative numbering
set sessionoptions-=options    " Don't store options in sessions
set shiftround                 " Round indent to multiple of 'shiftwidth'
set shiftwidth=4               " Number of space insert/remove shifting line
set shortmess=I                " Hide intro message
set smartcase                  " Performs case sensitive search if contains uppercase letters
set smartindent                " Smart indentation
set softtabstop=4              " Number of spaces in tab when editing
set splitright                 " New windows goes right
set t_Co=256                   " Set terminal color to 256
set tabpagemax=50              " Maximux number of tab pages to be opened from command
set tabstop=4                  " Number of visual spaces per TAB
set title                      " Change terminal title
set ttyfast                    " Optimize for fast terminal connections
set undofile                   " Persistent undo
set undolevels=1000            " How many undos
set undoreload=10000           " Number of lines to save for undo
set wildmenu                   " Visual autocomplete for command menu
syntax on


if !empty(&viminfo)
  set viminfo^=!
endif

filetype plugin indent on

"==============================================================================
" Plugin list
"==============================================================================

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/syntastic'
Plug 'Shougo/deoplete.nvim'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

Plug 'nvie/vim-flake8'
Plug 'othree/html5.vim'
Plug 'tmhedberg/matchit'
Plug 'majutsushi/tagbar'
Plug 'tomtom/tcomment_vim'
Plug 'tell-k/vim-autopep8'
Plug 'editorconfig/editorconfig-vim'

Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-obsession'
Plug 'wellle/targets.vim'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-vinegar'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'justinmk/vim-gtfo'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-eunuch'

Plug 'mhinz/vim-startify'

call plug#end()

"==============================================================================
" Colorscheme
"==============================================================================

set background=dark

let g:gruvbox_invert_selection=0
colorscheme gruvbox

" let base16colorspace=256  " Access colors present in 256 colorspace
" colorscheme base16-default

function! ToggleBackground()
    if &background=="dark"
        set background=light
    else
        set background=dark
    endif
endfunction

nnoremap <F5> :call ToggleBackground()<CR>

if has('nvim')
    " let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    " let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
endif

"==============================================================================
" Mappings
"==============================================================================
if has('nvim')
    tnoremap <A-h> <C-\><C-n><C-w>h
    tnoremap <A-j> <C-\><C-n><C-w>j
    tnoremap <A-k> <C-\><C-n><C-w>k
    tnoremap <A-l> <C-\><C-n><C-w>l

    tnoremap <C-q> <C-\><C-n>
endif

" Key binding for moving between splits
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Move line up/down
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
xnoremap <C-j> :m '>+1<CR>gv=gv
xnoremap <C-k> :m '<-2<CR>gv=gv

" Mapping for indentation
xnoremap < <gv
xnoremap > >gv
xnoremap <C-h> <gv
xnoremap <C-l> >gv
nnoremap <C-h> <<
nnoremap <C-l> >>

" Highlight last inserted text
nnoremap gV `[v`]

" Mapping to switch buffers
nnoremap gn :bnext<CR>
nnoremap gp :bprevious<CR>

nnoremap <Leader>q :bd<CR>
nnoremap <Leader>n :enew<CR>

nnoremap <leader>ev :edit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>


"==============================================================================
" Autocmd
"==============================================================================

autocmd Filetype html setlocal ts=2 sw=2 sts=2

"==============================================================================
" Synstastic
"==============================================================================

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_error_symbol = "✗"
let g:syntastic_style_error_symbol = "✠"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_style_warning_symbol = "≈"

"==============================================================================
" Airline
"==============================================================================

let g:airline_powerline_fonts = 1
" if !exists('g:airline_symbols')
"     let g:airline_symbols = {}
" endif

" Show buffer list at top
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_idx_mode = 1
" let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#enabled = 1

nmap <Leader>1 <Plug>AirlineSelectTab1
nmap <Leader>2 <Plug>AirlineSelectTab2
nmap <Leader>3 <Plug>AirlineSelectTab3
nmap <Leader>4 <Plug>AirlineSelectTab4
nmap <Leader>5 <Plug>AirlineSelectTab5
nmap <Leader>6 <Plug>AirlineSelectTab6
nmap <Leader>7 <Plug>AirlineSelectTab7
nmap <Leader>8 <Plug>AirlineSelectTab8
nmap <Leader>9 <Plug>AirlineSelectTab9

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

" let g:UltiSnipsUsePythonVersion = 2

let g:UltiSnipsExpandTrigger='<Tab>'
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
" deoplete
"==============================================================================

" Enable completion
let g:deoplete#enable_at_startup = 1

" Disable pydoc split
autocmd FileType python set completeopt-=preview

"==============================================================================
" Indentline
"==============================================================================

let g:indentLine_char = '┆'

"==============================================================================
" vim-tmux-navigator
"==============================================================================

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <A-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <A-j> :TmuxNavigateDown<cr>
nnoremap <silent> <A-k> :TmuxNavigateUp<cr>
nnoremap <silent> <A-l> :TmuxNavigateRight<cr>
" nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>
