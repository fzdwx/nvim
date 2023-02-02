return {

    {
        "onsails/lspkind.nvim",
        config = function()
            require("lspkind").init({
                symbol_map = require("icons").kind,
            })
        end,
    },

    -- extend auto completion
    {
        "hrsh7th/nvim-cmp",
        version = false, -- last release is way too old
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "saadparwaiz1/cmp_luasnip",
            "L3MON4D3/LuaSnip",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-emoji",
            "lukas-reineke/cmp-rg",
            "hrsh7th/cmp-calc",
        },
        config = function()
            local cmp = require("cmp")
            local lspkind = require("lspkind")
            cmp.setup({
                completion = {
                    completeopt = "menu,menuone,noinsert",
                },
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            local entry = cmp.get_selected_entry()
                            if not entry then
                                cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                            else
                                cmp.confirm()
                            end
                        else
                            fallback()
                        end
                    end, { "i", "s", "c" }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "buffer" },
                    { name = "path" },
                    { name = "emoji" },
                    { name = "calc" },
                    { name = "rg", keyword_length = 5 },
                }),
                formatting = {
                    format = lspkind.cmp_format({
                        with_text = false,
                        maxwidth = 50,
                        mode = "symbol",
                        menu = {
                            buffer = "BUF",
                            rg = "RG",
                            nvim_lsp = "LSP",
                            path = "PATH",
                            luasnip = "SNIP",
                            calc = "CALC",
                        },
                    }),
                },
                experimental = {
                    ghost_text = {
                        hl_group = "LspCodeLens",
                    },
                },
            })
            -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline("/", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = "buffer" },
                },
            })

            -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline(":", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = "path" },
                }, {
                    { name = "cmdline" },
                }),
            })
        end,
    },

    -- snippets
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "rafamadriz/friendly-snippets",
            config = function()
                require("luasnip.loaders.from_vscode").lazy_load()
            end,
        },
        opts = {
            history = true,
            delete_check_events = "TextChanged",
        },
        keys = {
            {
                "<s-tab>",
                function()
                    require("luasnip").jump(-1)
                end,
                mode = { "i", "s" },
            },
        },
    },

    -- tidy https://github.com/mcauley-penney/tidy.nvim
    {
        "mcauley-penney/tidy.nvim",
        event = "VeryLazy",
        config = {
            filetype_exclude = { "markdown", "diff" },
        },
    },
}
