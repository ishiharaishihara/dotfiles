local oil = require('oil')
local map = require 'functions'.map
oil.setup({
    float = {
        padding = 10,
        border = "rounded",
        win_options = {
            winblend = 0,
        },
    },
})
map('n', '-', '<cmd>Oil --float<cr>')
