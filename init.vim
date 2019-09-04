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
Plug 'ap/vim-css-color'
Plug 'mhinz/vim-signify'
Plug 'robertmeta/nofrils'
Plug 'itchyny/lightline.vim'

Plug 'reasonml-editor/vim-reason-plus'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" Support
Plug 'matze/vim-move'
Plug 'easymotion/vim-easymotion'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'ryanoasis/vim-devicons'
Plug 'terryma/vim-multiple-cursors'
Plug 'alvan/vim-closetag'
Plug 'phthhieu/vim-test'
Plug 'jremmen/vim-ripgrep'

" Git
Plug 'tpope/vim-fugitive'
Plug 'benmills/vimux'

" Dev
" Plug 'vim-scripts/Decho'

" Coding style
" Require npm install --global import-js
Plug 'galooshi/vim-import-js'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'css', 'json', 'scss'] }
Plug 'jiangmiao/auto-pairs'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" Send command to tmux
Plug 'jpalardy/vim-slime'

call plug#end()

let g:LanguageClient_serverCommands = {
    \ 'reason': ['~/.config/nvim/reason-language-server.exe'],
    \ }

let g:deoplete#enable_at_startup = 1

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
noremap <leader>o :Buffers <CR>
nnoremap <silent> <leader>ag :Ag <C-R><C-W><CR>

" Quick saving / edit
noremap <leader>w :w<cr>
noremap <leader>q :q<cr>
noremap <leader>x :x<cr>
" Split screen
noremap <leader>s :vsplit<cr>
noremap <leader>v :split<cr>

" Copy current file / folder path
nnoremap cp :let @* = expand("%")<CR>
nnoremap cP :let @* = expand("%:p")<CR>

" Git
noremap <leader>gs :Gstatus<cr>
noremap <leader>gb :Gblame<cr>
noremap <leader>gd :Gdiff<cr>

noremap <leader>gw :Gwrite<cr>
noremap <leader>gc :Gcommit<cr>
noremap <leader>gu :Gpull<cr>
noremap <leader>gp :Gpush<cr>

" Easy jump
map  <leader>j <Plug>(easymotion-bd-w)
nmap <leader>j <Plug>(easymotion-overwin-w)

" Import current word
nmap <leader>i :ImportJSFix<cr>

" Custom nerdtree
let g:NERDTreeSyntaxDisableDefaultExtensions = 1
let g:NERDTreeDisableExactMatchHighlight = 1
let g:NERDTreeDisablePatternMatchHighlight = 1
let g:NERDTreeSyntaxEnabledExtensions = ['rb', 'js', 'html', 'haml', 'css', 'erb', 'jsx', 'scss']
let g:NERDTreeLimitedSyntax = 1
let g:NERDTreeHighlightCursorline = 0

nmap <leader>ts :TestNearest<CR>
nmap <leader>tt :TestFile<CR>
nmap <leader>tf :call ToggleSourceSpecFile()<CR>

let test#strategy = "vimux"
let g:VimuxUseNearest = 0
let g:test#javascript#jest#executable = 'nvm use default && yarn test'
let g:VimuxOrientation = "h"
map <Leader>vq :VimuxCloseRunner<CR>
map <Leader>vz :VimuxZoomRunner<CR>
map <Leader>vi :VimuxInspectRunner<CR>

let g:closetag_filenames = '*.js,*.jsx'
let g:move_key_modifier = 'C'

nmap <leader>e :ALENext<CR>
nmap <leader>d :ALEPrevious<CR>

let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "{right-of}"}

filetype plugin indent on

set clipboard =unnamed
set autoindent " Copy indent from current line when starting a new line
set smarttab
set tabstop=2 " Number of space og a <Tab> character
set softtabstop=2
set shiftwidth=2 " Number of spaces use by autoindent
set lazyredraw
set regexpengine=1
set expandtab

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

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
let g:ale_linters = {'javascript': ['eslint', 'flow'], 'ruby': ['rubocop']}
let g:ale_fixers = {'javascript': ['eslint', 'prettier'], 'ruby': ['rubocop']}
" let g:ale_fix_on_save = 0
"
" Language client
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<cr>
nnoremap <silent> gf :call LanguageClient_textDocument_formatting()<cr>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>

" Auto format
autocmd BufWritePre * StripWhitespace
autocmd BufWritePre *.js,*.jsx,*.css,*.scss,*.less Prettier

" Quick escape
inoremap jk <ESC>
inoremap jj <ESC>

let $FZF_DEFAULT_COMMAND = 'ag -g ""'

colorscheme nofrils-dark
let g:nofrils_strbackgrounds=1
hi String ctermfg=247 guifg=#9e9e9e
hi Directory ctermfg=white

" Required for operations modifying multiple buffers like rename.
set hidden

" Custom Script

function! GoToSourceFile() abort
  let file = expand("%")
  let parts = split(file, "/")

  let last = parts[-1]
  let fileName = split(last, '\.')[0]
  let extension = split(last, '\.')[2]

  let sourceFile = join(parts[:-3] + [join([fileName, extension], '.')], '/')
  if filereadable(sourceFile)
    execute "edit +" . "0" . " " . sourceFile
    return
  endif

  echoerr "Source file not found"
endfunction

function! GoToSpecFile() abort
  let file = expand("%")
  let parts = split(file, "/")

  let last = parts[-1]
  let fileName = split(last, '\.')[0]
  let extension = split(last, '\.')[1]

  let specFile = join(parts[:-2] + ['__tests__', join([fileName, 'spec', extension], '.')], '/')
  if filereadable(specFile)
    execute "edit +" . "0" . " " . specFile
    return
  endif

  echoerr "Test file not found"
endfunction


function! ToggleSourceSpecFile() abort
  let file = expand("%")
  if file =~ 'spec'
    call GoToSourceFile()
  else
    call GoToSpecFile()
  endif
endfunction
