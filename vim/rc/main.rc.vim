let g:rc_dir = expand('<sfile>:p:h') . '/'

function! s:source(file, ...)
    let use_global = get(a:000,0,!has('vim_starting'))
    if !use_global
        execute 'source' resolve(fnamemodify(g:rc_dir . a:file,':p'))
    endif
endfunction

"encoding option
set encoding=utf-8
set fileencodings=utf-8,cp932
scriptencoding utf-8
set fileformats=unix,dos,mac

augroup MyAutoCmd
    autocmd!
    autocmd QuickFixCmdPost *grep* cwindow
augroup END

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


nmap <ESC><ESC> :nohlsearch<CR><Esc>
nnoremap j gj
nnoremap k gk

call s:source('dein.rc.vim')
call s:source('options.rc.vim')

