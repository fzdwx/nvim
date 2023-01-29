return {
    {
        "nvim-telescope/telescope.nvim",
        event = "VimEnter",
        opts = {
            defaults = {
                prompt_prefix = " ",
                selection_caret = " ",
                layout_strategy = "horizontal",
                layout_config = {
                    horizontal = {
                        preview_width = 0.55,
                        results_width = 0.8,
                    },
                    height = 0.9,
                    width = 0.87,
                    preview_cutoff = 120,
                },
                extensions = {
                    undo = {
                        use_delta = true,
                        side_by_side = true,
                        layout_strategy = "horizontal",
                        layout_config = {
                            preview_height = 0.4,
                        },
                    },
                },
            },
        },
    },

    -- add telescope-fzf-native
    {
        "telescope.nvim",
        dependencies = {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            config = function()
                require("telescope").load_extension("fzf")
            end,
        },
    },

    -- add telescope-fzf-native
    {
        "telescope.nvim",
        dependencies = {
            "nvim-telescope/telescope-dap.nvim",
            config = function()
                require("telescope").load_extension("dap")
            end,
        },
    },

    -- add telescope-fzf-native
    {
        "telescope.nvim",
        dependencies = {
            "debugloop/telescope-undo.nvim",
            config = function()
                require("telescope").load_extension("undo")
            end,
        },
    },

    -- add telescope-fzf-native
    {
        "telescope.nvim",
        dependencies = {
            "ahmedkhalf/project.nvim",
            event = "VimEnter",
            config = function()
                require("project_nvim").setup({
                    patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
                })
                require("telescope").load_extension("projects")
            end
        },
    },
}