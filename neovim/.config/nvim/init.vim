"==============================================================================
" General vim settings
"==============================================================================

let mapleader=' '
let maplocalleader=' '

set colorcolumn=80    " Ruler for maximum characters
set copyindent        " Use indentation for previous line as a default
set cursorline        " Highlight current line
set diffopt+=vertical " Use vertical splits
set expandtab         " Tabs are spaces
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
set termguicolors     " Enable 25 bit color support
set title             " Change terminal title
set undofile          " Persistent undo
set undolevels=1000   " How many undos
set undoreload=10000  " Number of lines to save for undo

if has('nvim-0.7')
    set laststatus=3      " Global statusline
endif



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
Plug 'mhinz/vim-signify'
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'neovim/nvim-lspconfig'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

Plug 'justinmk/vim-dirvish'
Plug 'junegunn/vim-easy-align', { 'on' : ['<Plug>(EasyAlign)', 'EasyAlign'] }
Plug 'wellle/targets.vim'
Plug 'tmhedberg/matchit'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
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

"==============================================================================
" LSP Configuration
"==============================================================================

lua << EOF
local nvim_lsp = require('lspconfig')
require'lspconfig'.pylsp.setup{}

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "pylsp" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
EOF

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
" FZF
"==============================================================================

nnoremap <Leader>f :FZF<CR>

"==============================================================================
" Ack.vim
"==============================================================================

" Disable immediate jumping to match
cnoreabbrev Ack Ack!

if executable('rg')
  let g:ackprg = 'rg --vimgrep --no-heading'
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
" vimwiki
"==============================================================================

let g:vimwiki_list = [{'path': '~/vimwiki/',
                    \ 'syntax': 'markdown', 'ext': '.md'}]

"==============================================================================
" Custom mapping and configurations
"==============================================================================

noremap Y y$
xnoremap < <gv
xnoremap > >gv
nnoremap gV `[v`]
nnoremap <leader>ev :edit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>r :checktime<cr>

command! FormatJSON %!python3 -m json.tool
command! FormatXML %!python3 -c "import xml.dom.minidom, sys; print(xml.dom.minidom.parse(sys.stdin).toprettyxml())"
command! ToggleBackground call ToggleBackground()

source ~/.vimrc_local
