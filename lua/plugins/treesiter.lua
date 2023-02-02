return {
    {
        "p00f/nvim-ts-rainbow",
        event = "VeryLazy",
    },

    {
        "nvim-treesitter/nvim-treesitter",
        version = false,
        build = ":TSUpdate",
        event = "BufReadPost",
        keys = {
            { "<c-space>", desc = "Increment selection" },
            { "<bs>", desc = "Schrink selection", mode = "x" },
        },
        opts = {
            highlight = { enable = true },
            rainbow = {
                -- https://github.com/mrjones2014/nvim-ts-rainbow
                enable = true,
                extended_mode = true,
            },
            indent = { enable = true },
            context_commentstring = { enable = true, enable_autocmd = false },
            ensure_installed = {
                "bash",
                "help",
                "html",
                "javascript",
                "json",
                "lua",
                "markdown",
                "markdown_inline",
                "python",
                "query",
                "regex",
                "tsx",
                "typescript",
                "vim",
                "yaml",
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-space>",
                    node_incremental = "<C-space>",
                    scope_incremental = "<nop>",
                    node_decremental = "<bs>",
                },
            },
        },
    },
}
