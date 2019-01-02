call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline-themes'
Plug 'roosta/vim-srcery'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'easymotion/vim-easymotion'
Plug 'kassio/neoterm'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tomtom/tcomment_vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'ntpeters/vim-better-whitespace'
Plug 'flazz/vim-colorschemes'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-surround'
Plug 'neomake/neomake'
Plug 'tpope/vim-endwise'
Plug 'janko-m/vim-test'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-fugitive'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'matze/vim-move'
Plug 'carlitux/deoplete-ternjs'
Plug 'ryanoasis/vim-devicons'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'css', 'json', 'scss'] }
Plug 'ap/vim-css-color'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-obsession'
Plug 'dhruvasagar/vim-prosession'
" Require npm install --global import-js
Plug 'galooshi/vim-import-js'

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

noremap <Leader>f :FZF<CR>
noremap <Leader>a :Ag <CR>
noremap <Leader>a :Ag <CR>
nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR>

" Move around error
noremap <Leader>n :lnext<CR>
noremap <Leader>p :lprev<CR>
noremap <Leader>w :w<cr>
noremap <Leader>q :xa<cr>
noremap <Leader>x :x<cr>
" Split screen
noremap <leader>s :vsplit<cr>
noremap <leader>v :split<cr>
" Resize screen
noremap <leader>= :vertical resize +20<cr>
noremap <leader>- :vertical resize -20<cr>

" Reveal current folder
function! RevealCurrentFolder()
  call system("open '" . expand("%:p:h") . "'")
endfunction
nnoremap <leader>~ :call RevealCurrentFolder()<cr>

" Copy current file / folder path
nnoremap cp :let @* = expand("%")<CR>
nnoremap cP :let @* = expand("%:p")<CR>

" Highlight all file content
map <C-a> <esc> ggVG<cr>

" Git
noremap <Leader>gs :Gstatus<cr>
noremap <Leader>gb :Gblame<cr>
noremap <Leader>gd :Gdiff<cr>

" Quick escape
inoremap jk <ESC>

autocmd! BufWritePost .config/nvim/init.vim source %
autocmd BufWritePre * StripWhitespace

set termguicolors
autocmd! BufWritePost,BufEnter * Neomake
syntax enable
syntax on
filetype plugin indent on
colorscheme srcery

set clipboard =unnamed
set autoread
set background=dark
set number
set autoindent " Copy indent from current line when starting a new line
set smarttab
set tabstop=2 " Number of space og a <Tab> character
set softtabstop=2
set shiftwidth=2 " Number of spaces use by autoindent
set expandtab " Pressing <Tab> puts spaces, and < and > for indenting uses psaces
set nobackup
set noswapfile
set visualbell
set noerrorbells
set guifont=DroidSansMonoPLNerd:h12

set synmaxcol=128
set lazyredraw
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2
syntax sync minlines=256

let g:NERDTreeLimitedSyntax = 1
let g:NERDTreeHighlightCursorline = 0

" Run current cucumber scenario
"========================================================
" CONFIG Cucumber
"========================================================
let test#strategy = "neovim"
map <Leader>tt :TestFile<CR>
map <Leader>ts :TestNearest<CR>

" Linter error
map <Leader>en :lnext<CR>
map <Leader>eN :lprevious<CR>

"========================================================
" CONFIG NEOMAKE
"========================================================
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_javascript_eslint_exe = $PWD .'/node_modules/.bin/eslint'
let g:javascript_plugin_flow = 1

let g:neomake_ruby_enabled_makers = ['rubocop']
" let g:neomake_error_sign = {'text': '💧', 'texthl': 'NeomakeWarningMsg'}
" let g:neomake_warning_sign = {'text': '💧', 'texthl': 'NeomakeErrorMsg'}
"========================================================
" CONFIG AIRLINE THEME
"========================================================
let g:airline#extensions#branch#format = 0
let g:airline_theme='powerlineish'
let g:oceanic_next_terminal_bold = 1
let g:move_key_modifier= 'C'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
map <c-]> <ESC>:call fzf#vim#tags(expand("<cword>"), fzf#vim#layout(expand("<bang>0")))<cr>
let g:airline_powerline_fonts = 1
let g:airline_left_sep = '⭔'
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline#extensions#branch#displayed_head_limit = 10
let g:airline#extensions#default#layout = [
      \ [ 'a', 'b', 'c' ],
      \ [ 'z', 'error', 'warning' ]]
"==============================================================
" CONFIG CLOJURE
"==============================================================
let g:vimclojure#HighlightBuiltins = 1
let g:vimclojure#ParenRainbow = 1

" Config deoplete
let g:deoplete#enable_at_startup = 1

" Config js stuff
let g:neomake_open_list=0
let g:neomake_jsx_enabled_makers = ['eslint']
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" Relative numbering
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
    set number
  else
    set rnu
  endif
endfunc

" Toggle between normal and relative numbering.
nnoremap <leader>l :call NumberToggle()<cr>
" Set relative line by default
set rnu

" Prettier
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.css,*.scss,*.less Prettier

" Required for operations modifying multiple buffers like rename.
set hidden
