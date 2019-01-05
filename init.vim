call plug#begin('~/.vim/plugged')
" Essential
Plug 'sheerun/vim-polyglot'
Plug 'w0rp/ale'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'carlitux/deoplete-ternjs'

" Theme + Style
Plug 'roosta/vim-srcery'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
Plug 'ap/vim-css-color'
Plug 'mhinz/vim-signify'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tomasr/molokai'

" Support
Plug 'matze/vim-move'
Plug 'easymotion/vim-easymotion'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'ryanoasis/vim-devicons'

" Git
Plug 'tpope/vim-fugitive'

" Coding style
" Require npm install --global import-js
Plug 'galooshi/vim-import-js'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'css', 'json', 'scss'] }
Plug 'jiangmiao/auto-pairs'

" Save vim session
Plug 'tpope/vim-obsession'
Plug 'dhruvasagar/vim-prosession'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

call plug#end()

nnoremap <Esc> :noh<CR><Esc>
"========================================================
" leader config
"========================================================
let mapleader=" "
noremap <silent><leader>m :NERDTreeToggle<CR>
map <leader>r :NERDTreeFind<cr>

" Searching
noremap <leader>f :FZF<CR>
noremap <leader>a :Ag <CR>
noremap <leader>a :Ag <CR>
nnoremap <silent> <leader>ag :Ag <C-R><C-W><CR>

" Quick saving / edit
noremap <leader>w :w<cr>
noremap <leader>q :xa<cr>
noremap <leader>x :x<cr>
" Split screen
noremap <leader>s :vsplit<cr>
noremap <leader>v :split<cr>

" Move between tabs quicklier
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Resize screen
noremap <leader>= :vertical resize +20<cr>
noremap <leader>- :vertical resize -20<cr>

" Copy current file / folder path
nnoremap cp :let @* = expand("%")<CR>
nnoremap cP :let @* = expand("%:p")<CR>

" Git
noremap <leader>gs :Gstatus<cr>
noremap <leader>gb :Gblame<cr>
noremap <leader>gd :Gdiff<cr>

" Easy jump
map  <leader>j <Plug>(easymotion-bd-w)
nmap <leader>j <Plug>(easymotion-overwin-w)

" Import current word
nmap <leader>i :ImportJSWord<cr>

" Quick escape
inoremap jk <ESC>
inoremap kj <ESC>

autocmd! BufWritePost .config/nvim/init.vim source %
autocmd BufWritePre * StripWhitespace

" Snippet
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
let g:neosnippet#snippets_directory='~/.config/nvim/snippets'
" End Snippet

syntax enable
syntax on
syntax sync minlines=256
filetype plugin indent on
colorscheme molokai

set termguicolors
set clipboard =unnamed
set autoindent " Copy indent from current line when starting a new line
set smarttab
set tabstop=2 " Number of space og a <Tab> character
set softtabstop=2
set shiftwidth=2 " Number of spaces use by autoindent
set guifont=DroidSansMonoPLNerd:h12
set lazyredraw

set synmaxcol=128
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

set nobackup
set noswapfile

set number
set rnu

let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" AleFix
let b:ale_fixers = ['prettier', 'eslint']
let g:ale_fix_on_save = 1

" Prettier
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.css,*.scss,*.less Prettier

" Required for operations modifying multiple buffers like rename.
set hidden
