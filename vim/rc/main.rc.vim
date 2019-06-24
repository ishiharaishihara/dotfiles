let g:rc_dir = fnamemodify(expand('<sfile>',':p'),':h') . '/'

function! s:source(file, ...)
    let use_global = get(a:000,0,!has('vim_starting'))
    if !use_global
        execute 'source' resolve(expand(g:rc_dir . a:file,':p'))
    endif
endfunction

"encoding option
set encoding=utf-8
set fileencoding=utf-8
scriptencoding utf-8

augroup MyAutoCmd
    autocmd!
    autocmd QuickFixCmdPost *grep* cwindow
augroup END
setlocal foldmethod=marker
set foldopen=all
set foldclose=all
set shellslash
set fileformats=unix
set autoread
set hidden
set showcmd
if has('win32')
    set shell=powershell shellquote=\" shellpipe=\| shellredir=>
    set shellcmdflag=-Command
    let &shellxquote=' '
else
    set shell=$SHELL
endif

let python3_host_prog=$PYENV_ROOT . "/shims/python3"
if !has('nvim')
    set pyx=3
endif
let $NVIM_PYTHON_LOG_FILE='/tmp/nvim_log'
let $NVIM_PYTHON_LOG_LEVEL='DEBUG'


set number
set relativenumber
set cursorline
set virtualedit=onemore
set smartindent
set visualbell
set showmatch
set laststatus=2
set wildmode=list:longest
set expandtab
nnoremap j gj
nnoremap k gk

set tabstop=4
set shiftwidth=4

set ignorecase
set smartcase
set incsearch
set nowrap
set wrapscan
set clipboard=unnamedplus
set signcolumn=yes
set hlsearch
nmap <ESC><ESC> :nohlsearch<CR><Esc>

set iminsert=0
set imsearch=-1

set directory=~/vimtemp
set backupdir=~/vimtemp
set undodir=~/vimtemp
if !has('nvim')
    set viminfo+=n~/vimtemp/viminfo.txt
endif

call s:source('dein.rc.vim')

if has('conceal')
  set conceallevel=2 concealcursor=i
endif
