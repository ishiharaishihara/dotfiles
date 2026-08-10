require('remote-sshfs').setup()
local map = require 'functions'.map
map('n', '<leader>rc', '<cmd>lua require("remote-sshfs.api").connect()<cr>')
map('n', '<leader>rd', '<cmd>lua require("remote-sshfs.api").disconnect()<cr>')
map('n', '<leader>re', '<cmd>lua require("remote-sshfs.api").edit()<cr>')
