local toggleterm_manager = require('toggleterm-manager')
local actions = toggleterm_manager.actions
toggleterm_manager.setup({
    mappings = {
        i = {
            ["<CR>"] = { action = actions.toggle_term, exit_on_action = true },
        },
        n = {
            ["<CR>"] = { action = actions.toggle_term, exit_on_action = true },
        },
    }
})
local map = require 'functions'.map
map('n', '<leader>tt', '<cmd>Telescope toggleterm_manager<cr>')
