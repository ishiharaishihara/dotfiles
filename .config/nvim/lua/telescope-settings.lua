local telescope = require('telescope')
telescope.load_extension 'ghq'
telescope.load_extension 'projects'
telescope.load_extension 'file_browser'
telescope.load_extension 'undo'
telescope.load_extension 'neoclip'
telescope.load_extension 'fzf'
telescope.load_extension 'ui-select'

local actions = require("telescope.actions")
telescope.setup({
    defaults = {
        file_ignore_patterns = { "%.git/", "node_modules/", "vendor/" },
    },
    pickers = {
        find_files = {
            hidden = true,
            no_ignore = false,
        },
        buffers = {
            mappings = {
                i = {
                    ["<C-d>"] = actions.delete_buffer,
                },
                n = {
                    ["dd"] = actions.delete_buffer,
                },
            },
        }
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        }
    }
})
local map = require 'functions'.map
map('n', '<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<cr>')
map('n', '<leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<cr>')
map('n', '<leader>fb', '<cmd>lua require("telescope.builtin").buffers()<cr>')
map('n', '<leader>fh', '<cmd>lua require("telescope.builtin").help_tags()<cr>')
map('n', '<leader>fq', '<cmd>lua require("telescope").extensions.ghq.list()<cr>')
map('n', '<leader>fp', '<cmd>lua require("telescope").extensions.projects.projects()<cr>')
map('n', '<leader>fe', '<cmd>lua require("telescope").extensions.file_browser.file_browser({hidden = true})<cr>')
map('n', '<leader>fy', '<cmd>lua require("telescope").extensions.neoclip.default()<cr>')
map('n', '<leader>fu', '<cmd>lua require("telescope").extensions.undo.undo()<cr>')
map('n', '<leader>fm', '<cmd>lua require("telescope.builtin").find_files({cwd = vim.fn.expand("~")})<cr>')
