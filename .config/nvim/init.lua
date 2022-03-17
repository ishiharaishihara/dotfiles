local o = vim.o
local cmd = vim.cmd

o.encoding='utf-8'
o.fileencodings='utf-8,cp932'
o.fileformats='unix,dos,mac'



require('options')

require('plugins')

cmd([[
 augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

cmd[[colorscheme tokyonight]]
cmd('syntax on')
