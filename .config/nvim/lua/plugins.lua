local fn = vim.fn
local install_path = fn.stdpath'data'..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end

return require'packer'.startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'folke/tokyonight.nvim'
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/cmp-vsnip'
    use 'onecentlin/laravel5-snippets-vscode'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-buffer'
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            {'nvim-lua/plenary.nvim'},
            {'nvim-telescope/telescope-ghq.nvim'},
        },
        config = function ()
            require'telescope-settings'
        end
    }
    use {
        'hrsh7th/nvim-cmp',
        config = function ()
            require'cmp-settings'
        end
    }
    use {
        'kabouzeid/nvim-lspinstall',
        config = function ()
            require'lsp-settings'
        end
    }
    use {
        'windwp/nvim-autopairs',
        config = function()
            require'nvim-autopairs'.setup{}
        end
    }
    use {
        'blackCauldron7/surround.nvim',
        config = function()
            require'surround'.setup{mappings_style = 'sandwich'}
        end
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require'nvim-treesitter.configs'.setup{
                ensure_installed = "maintained",
                highlight = {
                    enable = true,
                },
                indent = {
                    enable = true,
                }
            }
            local parser_config = require'nvim-treesitter.parsers'.get_parser_configs()
            parser_config.gotmpl = {
                install_info = {
                    url = "https://github.com/ngalaiko/tree-sitter-go-template",
                    files = {"src/parser.c"}
                },
                filetype = "gotmpl",
                used_by = {"gohtmltmpl", "gotexttmpl", "gotmpl", "yaml"}
            }
        end,
    }
end)
