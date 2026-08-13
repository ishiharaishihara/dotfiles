local fn = vim.fn
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd 'packadd packer.nvim'
end

return require 'packer'.startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'folke/tokyonight.nvim'
    use 'hrsh7th/vim-vsnip'
    --    use 'hrsh7th/cmp-vsnip'
    use 'onecentlin/laravel5-snippets-vscode'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-buffer'
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            { 'nvim-lua/plenary.nvim' },
            { 'nvim-telescope/telescope-ghq.nvim' },
        },
        config = function()
            require 'telescope-settings'
        end
    }
    use {
        'hrsh7th/nvim-cmp',
        config = function()
            require 'cmp-settings'
        end
    }
    use 'williamboman/mason.nvim'
    use 'neovim/nvim-lspconfig'
    use {
        'williamboman/mason-lspconfig.nvim',
        requires = { 'williamboman/mason.nvim', 'neovim/nvim-lspconfig' },
        config = function()
            require 'mason'.setup()

            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "bashls",
                    "intelephense",
                    "html",
                    "ts_ls",
                    "yamlls",
                    "jsonls",
                    "gopls",
                    "terraformls",
                    "tflint",
                    "gh_actions_ls",
                    "marksman",
                }
            })
        end
    }
    use {
        "nvimtools/none-ls.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            local null_ls = require("null-ls")

            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.mdformat,
                },
            })
        end,
    }
    use {
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        config = function()
            require('mason-tool-installer').setup({
                ensure_installed = {
                    "mdformat"
                }
            })
        end
    }
    use {
        'windwp/nvim-autopairs',
        config = function()
            require 'nvim-autopairs'.setup {}
        end
    }
    use 'nvim-lua/plenary.nvim'
    use 'MunifTanjim/nui.nvim'
    use 'MeanderingProgrammer/render-markdown.nvim'
    use 'nvim-tree/nvim-web-devicons'
    use 'HakonHarnes/img-clip.nvim'

    use {
        'yetone/avante.nvim',
        branch = 'main',
        run = 'make',
        requires = {
            'MeanderingProgrammer/render-markdown.nvim',
            'nvim-lua/plenary.nvim',
            'MunifTanjim/nui.nvim',
        },
        config = function()
            require 'avante-settings'
        end
    }
    use {
        'ahmedkhalf/project.nvim',
        config = function()
            require("project_nvim").setup({
                detection_methods = { "lsp", "pattern" },
                patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
                manual_mode = false,
            })
        end
    }
    use {
        "nvim-telescope/telescope-file-browser.nvim",
        requires = { "nvim-telescope/telescope.nvim", "nvim-tree/nvim-web-devicons" }
    }
    use {
        "AckslD/nvim-neoclip.lua",
        requires = { 'nvim-telescope/telescope.nvim' },
        config = function()
            require('neoclip').setup()
        end
    }
    use {
        "debugloop/telescope-undo.nvim",
        requires = { "nvim-telescope/telescope.nvim" },
    }
    use {
        'stevearc/oil.nvim',
        requires = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require 'oil-settings'
        end
    }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use { 'nvim-telescope/telescope-ui-select.nvim' }
    use {
        'rmagatti/auto-session',
        config = function()
            require("auto-session").setup({
                single_session_mode = true
            })
        end
    }
    use {
        'akinsho/toggleterm.nvim',
        config = function()
            require "toggleterm-settings"
        end
    }
    use 'rcarriga/nvim-notify'
    use {
        "folke/noice.nvim",
        requires = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify"
        },
        require("noice").setup()
    }
    use {
        "ryanmsnyder/toggleterm-manager.nvim",
        requires = {
            "akinsho/nvim-toggleterm.lua",
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require 'toggleterm-manager-settings'
        end
    }
    use {
        'lewis6991/gitsigns.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function()
            require 'gitsigns-settings'
        end
    }
    use {
        "kdheepak/lazygit.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            local map = require 'functions'.map
            map('n', '<leader>lg', '<cmd>LazyGit<cr>')
        end

    }
    use {
        'pwntester/octo.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope.nvim',
            'nvim-tree/nvim-web-devicons',
        },
        config = function()
            require('octo').setup()
            local map = require 'functions'.map
            map('n', '<leader>gt', '<cmd>Octo search org:tecpresso state:open<cr>')
            map('n', '<leader>go', '<cmd>Octo search involves:@me state:open<cr>')
        end,
    }
end)
