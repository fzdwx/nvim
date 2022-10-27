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

    use({
        "goolord/alpha-nvim",
        config = function()
            require("config.plugins.alphax").setup(require("alpha"))
        end,
    })

    use "kyazdani42/nvim-web-devicons";

    use {
        "ahmedkhalf/project.nvim",
        'nvim-lua/popup.nvim',
    }

    use({
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        config = function()
            require("config.plugins.telescope").setup(require("telescope"))
        end
    })

    use({
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        config = function()
            require("lsp_lines").setup()
        end,
    })

    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    use {
        "kevinhwang91/nvim-bqf",
        config = function()
            require("config.plugins.bqfx").setup(require("bqf"))
        end,
    }

    use {
        'kyazdani42/nvim-tree.lua',
        config = function()
            require("nvim-tree").setup()
        end,
        requires = {
            'kyazdani42/nvim-web-devicons',
        },

        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }
    -- using packer.nvim
    use { 'akinsho/bufferline.nvim',
          tag = "v2.*",
          requires = 'kyazdani42/nvim-web-devicons',
          config = function()
              require("config.plugins.buf").setup(require("bufferline"))
          end
    }

    -- synox
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require("config.plugins.treesitter").setup(require("nvim-treesitter.configs"))
        end
    }

    -- themes
    use {
        '/home/like/IdeaProjects/aura.nvim',
        config = function()
            require("aura").setup()
        end
    }

    -- lualine
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function()
            require("lualine").setup()
        end
    }

    -- lsp about
    use {
        { "williamboman/mason.nvim",
          config = function()
              require("config.plugins.lsp").setup_mason(require("mason"))
          end
        },
        "neovim/nvim-lspconfig",
        { "williamboman/mason-lspconfig.nvim",
          config = function()
              require("config.plugins.lsp").setup_mason_cfg(require("mason-lspconfig"))
          end
        }
    }

    -- rust
    use 'simrat39/rust-tools.nvim'
    use {
        'saecki/crates.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('crates').setup()
        end,
    }

    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    -- debugging 
    use 'nvim-lua/plenary.nvim'
    use 'mfussenegger/nvim-dap'

    -- cmp
    use 'hrsh7th/cmp-nvim-lsp' -- { name = nvim_lsp }
    use 'hrsh7th/cmp-buffer'   -- { name = 'buffer' },
    use 'hrsh7th/cmp-path'     -- { name = 'path' }
    use 'hrsh7th/cmp-cmdline'  -- { name = 'cmdline' }
    use 'saadparwaiz1/cmp_luasnip'
    use 'rafamadriz/friendly-snippets'
    use 'onsails/lspkind-nvim'
    use("L3MON4D3/LuaSnip")
    use {
        'hrsh7th/nvim-cmp',
        config = function()
            require("config.plugins.cmps").setup()
        end
    }

    use {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup {}
        end
    }

    -- term
    use { "akinsho/toggleterm.nvim",
          tag = '*',
          config = function()
              require("config.plugins.toterm").setup(require("toggleterm"))
          end
    }

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
    use {
        "folke/neodev.nvim",
        config = function()
            require('neodev').setup()
        end
    }

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
