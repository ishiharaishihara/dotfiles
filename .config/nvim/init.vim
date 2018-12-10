augroup MyAutoCmd
    autocmd!
augroup END
setlocal foldmethod=indent
set foldlevel=3
set foldopen=all
set foldclose=all
set shellslash
set encoding=utf-8
set fileencoding=utf-8
set fileformats=unix
set autoread
set hidden
set showcmd
if has('win32')
    set shell=powershell shellquote=\" shellpipe=\| shellredir=>
    set shellcmdflag=-Command
    let &shellxquote=' '
    let g:vimproc#download_windows_dll = 1
else
    set shell=/usr/bin/zsh
endif

let python3_host_prog=$PYENV_ROOT . "/shims/python3"


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
set hlsearch
nmap <ESC><ESC> :nohlsearch<CR><Esc>

set iminsert=0
set imsearch=-1

set directory=~/vimtemp
set backupdir=~/vimtemp
set viminfo+=n~/vimtemp/viminfo.txt
set undodir=~/vimtemp
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

"dein
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:config_home = empty($XDG_CONFIG_HOME) ? expand('$HOME/.config') : $XDG_CONFIG_HOME
let s:data_home = empty($XDG_DATA_HOME) ? expand('$HOME/.local/share') : $XDG_DATA_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir .'/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
    call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let g:dein#install_process_timeout = 600

let &runtimepath = s:dein_repo_dir .",". &runtimepath
let s:toml_file = fnamemodify(expand('<sfile>'), ':h').'/dein.toml'
let s:lazy_toml_file = fnamemodify(expand('<sfile>'), ':h').'/dein_lazy.toml'
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#load_toml(s:toml_file,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml_file, {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif
 
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

set background=dark
au MyAutoCmd VimEnter * nested colorscheme dracula
syntax on
