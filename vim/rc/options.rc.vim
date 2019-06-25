"set backupdir=~/.local/share/nvim/backup
set belloff=all
set complete doesn't include "i"
- 'cscopeverbose' is enabled
set directory' defaults to ~/.local/share/nvim/swap// (|xdg|), auto-created
- 'display' defaults to "lastline,msgsep"
- 'encoding' is UTF-8 (cf. 'fileencoding' for file-content encoding)
- 'fillchars' defaults (in effect) to "vert:│,fold:·"
- 'fsync' is disabled
- 'formatoptions' defaults to "tcqj"
- 'history' defaults to 10000 (the maximum)
- 'hlsearch' is set by default
- 'incsearch' is set by default
- 'langnoremap' is enabled by default
- 'langremap' is disabled by default
- 'laststatus' defaults to 2 (statusline is always shown)
- 'listchars' defaults to "tab:> ,trail:-,nbsp:+"
- 'nocompatible' is always set
- 'nrformats' defaults to "bin,hex"
- 'ruler' is set by default
- 'sessionoptions' doesn't include "options"
- 'shortmess' sets "F" flag
- 'showcmd' is set by default
- 'sidescroll' defaults to 1
- 'smarttab' is set by default
- 'tabpagemax' defaults to 50
- 'tags' defaults to "./tags;,tags"
- 'ttimeoutlen' defaults to 50
- 'ttyfast' is always set
- 'undodir' defaults to ~/.local/share/nvim/undo (|xdg|), auto-created
- 'viminfo' includes "!"
- 'wildmenu' is set by default

set foldmethod=marker
set foldopen=all
set foldclose=all
set shellslash
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

if !has('nvim')
    set viminfo+=n~/vimtemp/viminfo.txt
    set directory=~/vimtemp
    set backupdir=~/vimtemp
    set undodir=~/vimtemp
endif

if has('conceal')
  set conceallevel=2 concealcursor=i
endif
