require'telescope'.load_extension'ghq'
local map = require'functions'.map
map('n','<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<cr>')
map('n','<leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<cr>')
map('n','<leader>fb', '<cmd>lua require("telescope.builtin").buffers()<cr>')
map('n','<leader>fh', '<cmd>lua require("telescope.builtin").help_tags()<cr>')
map('n','<leader>fq', '<cmd>lua require("telescope").extensions.ghq.list()<cr>')
