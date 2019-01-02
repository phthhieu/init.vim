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
Plug 'flazz/vim-colorschemes'

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
  function! DoRemote(arg)
    UpdateRemotePlugins
  endfunction
  Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
endif

call plug#end()

nnoremap <Esc> :noh<CR><Esc>
"========================================================
" Leader config
"========================================================
let mapleader=" "
noremap <silent><Leader>m :NERDTreeToggle<CR>
map <Leader>r :NERDTreeFind<cr>

" Searching
noremap <Leader>f :FZF<CR>
noremap <Leader>a :Ag <CR>
noremap <Leader>a :Ag <CR>
nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR>

" Quick saving / edit
noremap <Leader>w :w<cr>
noremap <Leader>q :xa<cr>
noremap <Leader>x :x<cr>
" Split screen
noremap <leader>s :vsplit<cr>
noremap <leader>v :split<cr>

" Resize screen
noremap <leader>= :vertical resize +20<cr>
noremap <leader>- :vertical resize -20<cr>

" Copy current file / folder path
nnoremap cp :let @* = expand("%")<CR>
nnoremap cP :let @* = expand("%:p")<CR>

" Highlight all file content
nnoremap <C-a> <esc> ggVG<cr>

" Git
noremap <Leader>gs :Gstatus<cr>
noremap <Leader>gb :Gblame<cr>
noremap <Leader>gd :Gdiff<cr>

" Easy jump
map  <Leader>j <Plug>(easymotion-bd-w)
nmap <Leader>j <Plug>(easymotion-overwin-w)

" Import current word
nmap <Leader>i :ImportJSWord<cr>

" Quick escape
inoremap jk <ESC>
inoremap kj <ESC>

autocmd! BufWritePost .config/nvim/init.vim source %
autocmd BufWritePre * StripWhitespace

syntax enable
syntax on
syntax sync minlines=256
filetype plugin indent on
colorscheme srcery

set termguicolors
set clipboard =unnamed
set autoindent " Copy indent from current line when starting a new line
set smarttab
set tabstop=2 " Number of space og a <Tab> character
set softtabstop=2
set shiftwidth=2 " Number of spaces use by autoindent
set guifont=DroidSansMonoPLNerd:h12

set synmaxcol=128
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2
set rnu

" Config deoplete
let g:deoplete#enable_at_startup = 1

let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" AleFix
let b:ale_fixers = ['prettier', 'eslint']
let g:ale_fix_on_save = 1

" Prettier
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.css,*.scss,*.less Prettier

" Required for operations modifying multiple buffers like rename.
set hidden
