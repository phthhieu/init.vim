call plug#begin('~/.vim/plugged')
" Essential
Plug 'sheerun/vim-polyglot'
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'carlitux/deoplete-ternjs'
Plug 'codeindulgence/vim-tig'

" Theme + Style
Plug 'roosta/vim-srcery'
Plug 'ap/vim-css-color'
Plug 'mhinz/vim-signify'
Plug 'andreypopp/vim-colors-plain'
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
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'css', 'json', 'scss'] }
" Plug 'jiangmiao/auto-pairs'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" Send command to tmux
Plug 'jpalardy/vim-slime'

Plug 'galooshi/vim-import-js'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

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
nnoremap <C-g> :Rg<Cr>

" Quick saving / edit
noremap <leader>w :w<cr>
noremap <leader>q :q<cr>
" Split screen
noremap <leader>s :vsplit<cr>
noremap <leader>v :split<cr>

" Copy current file / folder path
nnoremap cp :let @* = expand("%")<CR>
nnoremap cP :let @* = expand("%:p")<CR>

" Git

noremap <leader>gu :Gpull<cr>
noremap <leader>gp :Gpush<cr>

noremap <leader>gs :Tig<cr>
noremap <leader>gl :Tig!<cr>
noremap <leader>gs :Tig show<cr>
noremap <leader>gb :Gblame<cr>

" Easy jump
map  <leader>j <Plug>(easymotion-bd-w)
nmap <leader>j <Plug>(easymotion-overwin-w)

" Custom nerdtree
let g:NERDTreeSyntaxDisableDefaultExtensions = 1
let g:NERDTreeDisableExactMatchHighlight = 1
let g:NERDTreeDisablePatternMatchHighlight = 1
let g:NERDTreeSyntaxEnabledExtensions = ['rb', 'js', 'html', 'haml', 'css', 'erb', 'jsx', 'scss']
let g:NERDTreeLimitedSyntax = 1
let g:NERDTreeHighlightCursorline = 0

nmap <leader>i :ImportJSFix<cr>

nmap <leader>ts :TestNearest<CR>
nmap <leader>tt :TestFile<CR>

let test#strategy = "vimux"
let g:test#javascript#jest#executable = 'yarn test'

let g:VimuxUseNearest = 0
let g:VimuxOrientation = "v"
map <Leader>vq :VimuxCloseRunner<CR>
map <Leader>vz :VimuxZoomRunner<CR>
map <Leader>vi :VimuxInspectRunner<CR>

let g:closetag_filenames = '*.js,*.jsx'
let g:move_key_modifier = 'C'

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

" ==== START COC config
set nowritebackup
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" === END COC config

" Auto format
autocmd BufWritePre * StripWhitespace
autocmd BufWritePre *.js,*.jsx,*.css,*.scss,*.less Prettier

" Quick escape
inoremap jk <ESC>
inoremap jj <ESC>

" Custom FZF
let $FZF_DEFAULT_COMMAND = 'rg --files --no-ignore-vcs --hidden'

colorscheme plain
set background=dark

" Required for operations modifying multiple buffers like rename.
set hidden
