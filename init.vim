"==============================================================================
" General vim settings
"==============================================================================

let mapleader=' '
let maplocalleader=' '
let g:python3_host_prog='/usr/bin/python3'

set colorcolumn=80             " Ruler for maximum characters
set cursorline                 " Highlight current line
set diffopt+=vertical          " Use vertical splits
set expandtab                  " Tabs are spaces
set foldenable                 " Enable folding
set foldlevelstart=10          " Open most folds by default
set foldmethod=indent          " Fold based on indent level
set hidden                     " Enables hidden buffer
set ignorecase                 " Case insensitive search
set lazyredraw                 " Redraw only when we need to
set list                       " Show invisible characters
set noswapfile                 " Disable swap file
set nowrap                     " Disable wrapping
set number                     " Shows line number
set relativenumber             " Enable relative numbering
set shiftround                 " Round indent to multiple of 'shiftwidth'
set shiftwidth=4               " Number of space insert/remove shifting line
set shortmess=I                " Hide intro message
set smartcase                  " Performs case sensitive search if contains uppercase letters
set smartindent                " Smart indentation
set softtabstop=4              " Number of spaces in tab when editing
set splitright                 " New windows goes right
set tabstop=4                  " Number of visual spaces per TAB
set termguicolors              " Enable 24 bit color support
set title                      " Change terminal title
set undofile                   " Persistent undo
set undolevels=1000            " How many undos
set undoreload=10000           " Number of lines to save for undo

" let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

"==============================================================================
" Plugin list
"==============================================================================

call plug#begin()

Plug 'morhetz/gruvbox'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'neomake/neomake'
Plug 'Shougo/deoplete.nvim'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'

Plug 'othree/html5.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'pangloss/vim-javascript'
Plug 'Chiel92/vim-autoformat'
Plug 'zchee/deoplete-jedi'

Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-eunuch'
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }
Plug 'justinmk/vim-dirvish'
Plug 'justinmk/vim-sneak'
Plug 'wellle/targets.vim'
Plug 'kshenoy/vim-signature'
Plug 'tmhedberg/matchit'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }

Plug 'mhinz/vim-startify'
Plug 'Yggdroot/indentLine'

Plug 'justinmk/vim-gtfo'
Plug 'tpope/vim-dispatch'
Plug 'christoomey/vim-tmux-navigator'

Plug 'editorconfig/editorconfig-vim'

call plug#end()

"==============================================================================
" Colorscheme
"==============================================================================

set background=dark

let g:gruvbox_invert_selection=0
let g:gruvbox_contrast_dark='soft'

colorscheme gruvbox

function! ToggleBackground()
    if &background=="dark"
        set background=light
    else
        set background=dark
    endif
endfunction

nnoremap <F5> :call ToggleBackground()<CR>

"==============================================================================
" Mappings
"==============================================================================

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

nnoremap <Leader>q :bdelete<CR>
nnoremap <Leader>n :enew<CR>

nnoremap <leader>ev :edit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Mapping for builtin terminal
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l

tnoremap <C-q> <C-\><C-n>

" Key binding for moving between splits
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Mappings for fugitive
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>gl :Dispatch git pull --ff-only<CR>
nnoremap <Leader>gp :Dispatch git push<CR>
nnoremap <Leader>gf :Dispatch git fetch<CR>

" Dispatch
nnoremap <Leader>w :Dispatch webpack<CR>
nnoremap <Leader>t :Dispatch py.test<CR>

"==============================================================================
" Autocmd
"==============================================================================

autocmd Filetype html setlocal ts=2 sw=2 sts=2
autocmd Filetype htmldjango setlocal ts=2 sw=2 sts=2

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
" let g:airline#extensions#tabline#buffer_idx_mode = 1
" let g:airline#extensions#tabline#buffer_nr_show = 1

let g:airline_section_z = '%l,%v'
let g:airline_section_error=''
let g:airline_section_warning=''

"==============================================================================
" Neomake
"==============================================================================

let g:neomake_error_sign = {'text': '✗', 'texthl': 'NeomakeErrorSign'}
let g:neomake_warning_sign = {'text': '✠', 'texthl': 'NeomakeWarningSign'}
let g:neomake_message_sign = {'text': '➤', 'texthl': 'NeomakeMessageSign'}
let g:neomake_info_sign = {'text': 'ℹ', 'texthl': 'NeomakeInfoSign'}

let g:neomake_python_enabled_makers = ['flake8']

autocmd! BufWritePost,BufEnter * Neomake

"==============================================================================
" deoplete
"==============================================================================

" Enable completion
let g:deoplete#enable_at_startup = 1

" Disable pydoc split
autocmd FileType python set completeopt-=preview

"==============================================================================
" vim-snippet
"==============================================================================

let g:UltiSnipsExpandTrigger='<Tab>'
let g:UltiSnipsJumpForwardTrigger='<c-b>'
let g:UltiSnipsJumpBackwardTrigger='<c-z>'

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
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>b :Buffers<CR>

" Advanced customization using autoload functions
autocmd VimEnter * command! Colors
  \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'})
"==============================================================================
" Ack.vim
"==============================================================================

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

"==============================================================================
" vim-easy-align
"==============================================================================

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"==============================================================================
" undotree
"==============================================================================

nmap <F3> :UndotreeToggle<CR>

"==============================================================================
" Indentline
"==============================================================================

let g:indentLine_char = '│'

"==============================================================================
" vim-tmux-navigator
"==============================================================================

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <A-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <A-j> :TmuxNavigateDown<cr>
nnoremap <silent> <A-k> :TmuxNavigateUp<cr>
nnoremap <silent> <A-l> :TmuxNavigateRight<cr>
" nnoremap <silent> <A-/> :TmuxNavigatePrevious<cr>

"==============================================================================
" vim-autoformat
"==============================================================================

noremap <F8> :Autoformat<CR>
