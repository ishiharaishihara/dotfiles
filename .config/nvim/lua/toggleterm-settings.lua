require("toggleterm").setup({
    open_mapping = [[<c-t>]],
    shade_terminals = false,
    direction = 'float',
    highlights = {
        Normal = { link = "Normal" },
        NormalFloat = { link = "NormalFloat" },
    },
    float_opts = {
        border = 'curved',


        winblend = 3,
    },
})
local map = require 'functions'.map
map('n', '<leader>tl',
    '<cmd>lua require("toggleterm").send_lines_to_terminal("single_line", trim_spaces, { args = vim.v.count })<cr>')
map('v', '<leader>ts',
    '<cmd>lua require("toggleterm").send_lines_to_terminal("visual_lines", trim_spaces, { args = vim.v.count })<cr>')
