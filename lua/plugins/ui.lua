return {
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufReadPost",
        config = function()
            require("indent_blankline").setup({
                filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy" },
                show_trailing_blankline_indent = true,
                show_current_context = true,
            })
        end,
    },

    -- dashboard
    {
        "goolord/alpha-nvim",
        opts = function(_, opts)
            local dashboard = require("alpha.themes.dashboard")
            opts.section.buttons.val = {
                dashboard.button(
                    "p",
                    " " .. "Open project",
                    "<cmd>lua require('telescope').extensions.projects.projects()<CR>"
                ),
                dashboard.button("f", " " .. "Find file", "<cmd>Telescope find_files<cr>"),
                dashboard.button("l", "鈴" .. "Lazy", "<cmd>Lazy<cr>"),
                dashboard.button("m", " " .. "Mason", "<cmd>Mason<cr>"),
                dashboard.button("r", " " .. "Recent files", "<CMD>Telescope oldfiles<cr>"),
                dashboard.button("s", " " .. "Settings", ":e $MYVIMRC <cr>"),
                dashboard.button("q", " " .. "Quit", "<cmd>qa<cr>"),
            }
            opts.config.opts.setup = function()
                vim.api.nvim_create_autocmd("User", {
                    pattern = "AlphaReady",
                    desc = "disable tabline for alpha",
                    callback = function()
                        vim.opt.showtabline = 0
                    end,
                })
                vim.api.nvim_create_autocmd("BufUnload", {
                    buffer = 0,
                    desc = "enable tabline after alpha",
                    callback = function()
                        vim.opt.showtabline = 2
                    end,
                })
            end
        end,
    },
}
