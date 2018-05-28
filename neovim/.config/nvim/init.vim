"==============================================================================
" General vim settings
"==============================================================================

let mapleader=' '
let maplocalleader=' '
let g:python3_host_prog='/usr/bin/python3'

set autoread          " Auto reload a file when changed
set colorcolumn=80    " Ruler for maximum characters
set copyindent        " Use indentation for previous line as a default
set cursorline        " Highlight current line
set diffopt+=vertical " Use vertical splits
set expandtab         " Tabs are spaces
set foldenable        " Enable folding
set foldlevelstart=10 " Open most folds by default
set foldmethod=indent " Fold based on indent level
set hidden            " Enables hidden buffer
set ignorecase        " Case insensitive search
set lazyredraw        " Redraw only when we need to
set list              " Show invisible characters
set noswapfile        " Disable swap file
set nowrap            " Disable wrapping
set number            " Shows line number
set relativenumber    " Enable relative numbering
set shiftround        " Round indent to multiple of 'shiftwidth'
set shiftwidth=4      " Number of space insert/remove shifting line
set shortmess=I       " Hide intro message
set smartcase         " Performs case sensitive search smartly
set smartindent       " Smart indentation
set softtabstop=4     " Number of spaces in tab when editing
set splitright        " New windows goes right
set tabstop=4         " Number of visual spaces per TAB
" set termguicolors     " Enable 24 bit color support
set title             " Change terminal title
set undofile          " Persistent undo
set undolevels=1000   " How many undos
set undoreload=10000  " Number of lines to save for undo

"==============================================================================
" Plugin list
"==============================================================================

" Automatic installation of vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Shougo/deoplete.nvim', { 'do': 'UpdateRemotePlugins' }
Plug 'Shougo/denite.nvim', { 'do': 'UpdateRemotePlugins' }
Plug 'mileszs/ack.vim'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

Plug 'othree/html5.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'pangloss/vim-javascript'

Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-tbone'

Plug 'justinmk/vim-dirvish'
Plug 'justinmk/vim-sneak'
Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }
Plug 'wellle/targets.vim'
Plug 'tmhedberg/matchit'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'editorconfig/editorconfig-vim'
Plug 'mhinz/vim-startify'
Plug 'christoomey/vim-tmux-navigator'

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

"==============================================================================
" Mappings
"==============================================================================

" Make Y behave like C and D
noremap Y y$

" Mapping for indentation
xnoremap < <gv
xnoremap > >gv

" Highlight last inserted text
nnoremap gV `[v`]

" Mapping for inbuilt terminal
tnoremap <C-q> <C-\><C-n>

" Mappings for fugitive
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gd :Gdiff<CR>

nnoremap <leader>ev :edit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Detect changes to the file
nnoremap <leader>r :checktime<cr>

"==============================================================================
" Autocmd
"==============================================================================

autocmd Filetype html setlocal ts=2 sw=2 sts=2
autocmd Filetype htmldjango setlocal ts=2 sw=2 sts=2

"==============================================================================
" Lightline
"==============================================================================

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightlineFugitive',
      \   'readonly': 'LightlineReadonly',
      \   'modified': 'LightlineModified',
      \   'filename': 'LightlineFilename'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

function! LightlineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! LightlineReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return ""
  else
    return ""
  endif
endfunction

function! LightlineFugitive()
  if exists("*fugitive#head")
    let branch = fugitive#head()
    return branch !=# '' ? ' '.branch : ''
  endif
  return ''
endfunction

function! LightlineFilename()
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
       \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
       \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

"==============================================================================
" deoplete
"==============================================================================

" Enable completion
let g:deoplete#enable_at_startup = 1

" Disable pydoc split
autocmd FileType python set completeopt-=preview

"==============================================================================
" denite
"==============================================================================

" Use silver searcher to search for files
call denite#custom#var('file_rec', 'command',
    \ ['rg', '--files', '--glob', '!.git'])

" Change mappings.
call denite#custom#map(
    \ 'insert',
    \ '<C-j>',
    \ '<denite:move_to_next_line>',
    \ 'noremap'
    \)

call denite#custom#map(
    \ 'insert',
    \ '<C-k>',
    \ '<denite:move_to_previous_line>',
    \ 'noremap'
    \)

" Change ignore_globs
call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
    \ [ '.git/', '.ropeproject/', '__pycache__/',
    \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])

nnoremap <Leader>f :Denite -winheight=15 buffer file_rec<CR>

"==============================================================================
" Ack.vim
"==============================================================================

" Disable immediate jumping to match
cnoreabbrev Ack Ack!

if executable('rg')
  let g:ackprg = 'rg --vimgrep --no-heading'
endif

"==============================================================================
" LanguageClient-neovim
"==============================================================================

" Automatically start language servers.
" let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
    \ 'python': ['pyls']
    \ }

let g:LanguageClient_diagnosticsDisplay = {
    \ 1: {
    \ "name": "Error",
    \ "texthl": "ALEError",
    \ "signText": "✗",
    \ "signTexthl": "ALEErrorSign",},
    \ 2: {
    \ "name": "Warning",
    \ "texthl": "ALEWarning",
    \  "signText": "✠",
    \  "signTexthl": "ALEWarningSign", },
    \  3: {
    \  "name": "Information",
    \  "texthl": "ALEInfo",
    \  "signText": "ℹ",
    \  "signTexthl": "ALEInfoSign",},
    \  4: {
    \  "name": "Hint",
    \  "texthl": "ALEInfo",
    \  "signText": "➤",
    \  "signTexthl": "ALEInfoSign",}}

nnoremap <silent> <F8> :call LanguageClient#textDocument_formatting()<CR>
nnoremap <silent> <Leader>gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <Leader>gh :call LanguageClient#textDocument_hover()<CR>

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
" vim-tmux-navigator
"==============================================================================

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <A-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <A-j> :TmuxNavigateDown<cr>
nnoremap <silent> <A-k> :TmuxNavigateUp<cr>
nnoremap <silent> <A-l> :TmuxNavigateRight<cr>
" nnoremap <silent> <A-/> :TmuxNavigatePrevious<cr>

"==============================================================================
" Custom commands
"==============================================================================

command! FormatJSON %!python -m json.tool
command! Notes edit ~/notes
command! Firefox execute ':silent !firefox %'
