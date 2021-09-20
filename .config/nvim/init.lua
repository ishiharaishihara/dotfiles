local o = vim.o
local cmd = vim.cmd

o.encoding='utf-8'
o.fileencodings='utf-8,cp932'
o.fileformats='unix,dos,mac'

function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

require('lua/options')

require('lua/plugins')

cmd([[
 augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

cmd[[colorscheme tokyonight]]
cmd('syntax on')

map('n','<esc><esc>',':nohlsearch<cr><esc>')
