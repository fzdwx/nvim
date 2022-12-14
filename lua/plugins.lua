---
--- the plugins
--- Created by like.
--- DateTime: 9/28/22 8:21 PM
---

--- setup packer
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd("packadd packer.nvim")
end

--- add plugins
require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use "goolord/alpha-nvim";

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        "ahmedkhalf/project.nvim",
        'nvim-lua/plenary.nvim',
        'nvim-lua/popup.nvim',
    }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use {
        "kevinhwang91/nvim-bqf",
        event = { "BufRead", "BufNew" },
        config = function()
            require("bqf").setup({
                auto_enable = true,
                preview = {
                    win_height = 12,
                    win_vheight = 12,
                    delay_syntax = 80,
                    border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
                },
                func_map = {
                    vsplit = "",
                    ptogglemode = "z,",
                    stoggleup = "",
                },
                filter = {
                    fzf = {
                        action_for = { ["ctrl-s"] = "split" },
                        extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
                    },
                },
            })
        end,
    }

    use {
        'kyazdani42/nvim-tree.lua',
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    use {
        'kyazdani42/nvim-web-devicons',
        config = function()
            require("nvim-web-devicons").setup{ default = true }
        end
    }
    -- using packer.nvim
    use { 'akinsho/bufferline.nvim', tag = "v2.*"}

    -- synox
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    ---- themes
    use {
        '/home/like/IdeaProjects/aura.nvim',
    --    config = function()
    --        require("aura").setup()
    --    end
    }

    --use 'sainnhe/everforest'

    -- lualine
    use {
        'nvim-lualine/lualine.nvim',
    }

    -- lsp about
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }

    -- rust
    use 'simrat39/rust-tools.nvim'
    use {
        'saecki/crates.nvim',
        config = function()
            require('crates').setup()
        end,
    }

    -- cmp
    use 'hrsh7th/cmp-nvim-lsp' -- { name = nvim_lsp }
    use 'hrsh7th/cmp-buffer'   -- { name = 'buffer' },
    use 'hrsh7th/cmp-path'     -- { name = 'path' }
    use 'hrsh7th/cmp-cmdline'  -- { name = 'cmdline' }
    use 'hrsh7th/nvim-cmp'
    use 'saadparwaiz1/cmp_luasnip'
    use 'rafamadriz/friendly-snippets'
    use 'onsails/lspkind-nvim'
    use({
        "L3MON4D3/LuaSnip",
        config = function()
            require("luasnip.loaders.from_lua").lazy_load()
            require("luasnip.loaders.from_vscode").lazy_load()
            require("luasnip.loaders.from_snipmate").lazy_load()
        end,
    })

    use {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup {}
        end
    }

    -- term
    use { "akinsho/toggleterm.nvim", tag = '*' }

    -- 注释
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    use {
        "f-person/git-blame.nvim",
        event = "BufRead",
        config = function()
            vim.cmd "highlight default link gitblame SpecialComment"
            vim.g.gitblame_enabled = 0
        end,
    }

    -- help dev neovim
    use "folke/neodev.nvim"
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)

-- 每次保存 plugins.lua 自动安装插件
pcall(
        vim.cmd,
        [[
          augroup packer_user_config
          autocmd!
          autocmd BufWritePost plugins.lua source <afile> | PackerSync
          augroup end
        ]]
)
