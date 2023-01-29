-- every spec file under config.plugins will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {

    -- disable mini.bufremove
    { "echasnovski/mini.bufremove", enabled = false },

    -- which-key extensions
    {
        "folke/which-key.nvim",
        opts = function()
            require("which-key").register({
                ["<leader>d"] = { name = "+debug", mode = { "n", "v" } },
                ["<leader>ct"] = { name = "+test" },
            })
        end,
    },

    -- git blame
    {
        "f-person/git-blame.nvim",
        event = "BufReadPre",
    },

    -- git conflict
    {
        "akinsho/git-conflict.nvim",
        event = "BufReadPre",
        config = true,
    },

    -- change trouble config
    {
        "folke/trouble.nvim",
        opts = { use_diagnostic_signs = true },
    },

    -- add zen-mode
    {
        "folke/zen-mode.nvim",
        cmd = "ZenMode",
        config = true,
        keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
    },
}
