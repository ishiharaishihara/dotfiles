vim.deprecate = function() end
local o = vim.o
local cmd = vim.cmd

if vim.fn.exists("*serverstart") == 1 and vim.v.servername == "" then
    vim.fn.serverstart(vim.fn.stdpath("run") .. "/nvim.sock")
end

if vim.fn.executable('nvr') == 1 then
    vim.env.EDITOR = 'nvr --remote-tab-wait +"set bufhidden=wipe"'
end

o.encoding = 'utf-8'
o.fileencodings = 'utf-8,cp932'
o.fileformats = 'unix,dos,mac'

require('options')

require('plugins')

vim.diagnostic.config({
    virtual_text = true,
})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        if vim.b.no_autoformat then
            return
        end
        vim.lsp.buf.format({ async = false })
    end,
})

cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerCompile
    augroup end
]])

cmd [[colorscheme tokyonight]]
cmd('syntax on')
