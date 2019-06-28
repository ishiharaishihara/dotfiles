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
let s:dein_toml = g:rc_dir . 'dein.toml'
let s:dein_lazy_toml = g:rc_dir . 'dein_lazy.toml'
let s:dein_ft_toml = g:rc_dir . 'deinft.toml'
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  call dein#load_toml(s:dein_toml,{'lazy': 0})
  call dein#load_toml(s:dein_lazy_toml, {'lazy': 1})
  call dein#load_toml(s:dein_ft_toml)

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif
