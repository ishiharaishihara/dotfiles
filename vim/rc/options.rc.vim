set foldmethod=marker
set foldopen=all
set foldclose=all
set shellslash
set autoread
set hidden
set showcmd
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

set iminsert=0
set imsearch=-1

set directory=~/vimtemp
set backupdir=~/vimtemp
set undodir=~/vimtemp
if !has('nvim')
    set viminfo+=n~/vimtemp/viminfo.txt
endif

if has('conceal')
  set conceallevel=2 concealcursor=i
endif
