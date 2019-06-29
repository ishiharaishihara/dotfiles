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
set visualbell
set showmatch
set laststatus=2
set wildmode=list:longest

"indent options
set smartindent
set expandtab
set tabstop=4
set shiftwidth=4

"search options
set ignorecase
set smartcase
set incsearch
set hlsearch

set nowrap
set wrapscan
set clipboard=unnamedplus
set signcolumn=yes

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

colorscheme dracula
syntax on
