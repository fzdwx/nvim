local st_i = {
    italic = true,
}

local st_b = {
    bold = true,
}

local color = require("color")

local theme = {
    functionName = color.orga,
    field = color.purc, -- "#73daca"
    type = color.blueb,
    keyword = color.main,
    keywordFunc = color.blueb,
    comment = color.greena,
    string = color.br_greena,
    border = color.main,
    normal = color.whitea,
}

return {

    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "tokyonight",
        },
    },

    -- https://github.com/folke/tokyonight.nvim/blob/main/lua/lualine/themes/tokyonight.lua
    -- https://github.com/folke/tokyonight.nvim/blob/main/extras/lua/tokyonight_storm.lua
    {
        "folke/tokyonight.nvim",
        opts = {
            style = "storm",
            transparent = true,
            styles = {
                sidebars = "transparent",
                floats = "transparent",
            },
            on_colors = function(colors)
                colors.bg_statusline = ""
                colors.gitSigns = {
                    add = color.main,
                    change = color.pura,
                    delete = color.redc,
                }
            end,
            on_highlights = function(hl, c)
                hl.String = { fg = theme.string, style = st_b }
                hl.Keyword = { fg = theme.keyword }
                hl.Function = { fg = theme.functionName }
                hl.Comment = { fg = color.foreground, style = st_i }
                hl.PreProc = { fg = color.bluea }
                hl.Statement = { fg = "#ff00ff" }

                hl.CursorLine = { bg = "" }

                hl.BufLineFill = { bg = "" }
                hl.BufLineTitleSel = { fg = color.whitea, bg = "" }
                hl.BufLineTitleNoSel = { fg = color.grey, bg = "" }

                --- 行号颜色
                hl.LineNr = { fg = color.activeForeground }

                hl.GitGutterAdd = { fg = color.main }
                hl.GitGutterChange = { fg = color.pura }
                hl.GitGutterDelete = { fg = color.bg_reda }
                hl.GitSignsAdd = { fg = color.main }
                hl.GitSignsChange = { fg = color.pura }
                hl.GitSignsDelete = { fg = color.bg_reda }
                hl.DiffAdd = { fg = color.main }
                hl.DiffChange = { fg = color.pura }
                hl.DiffDelete = { fg = color.bg_reda }

                hl["@keyword.function"] = { fg = theme.keywordFunc }
                hl["@keyword"] = { fg = theme.keyword, style = st_i }
                hl["@operator"] = { fg = color.purc }
                hl["@comment"] = { fg = color.greena, style = st_i }
                hl.Operator = { fg = color.purc }
                hl["@field"] = { fg = theme.field }
                hl["@property"] = { fg = theme.field }
                hl["@parameter"] = { fg = "" }

                hl.NvimTreeCursorLine = color.select

                hl.TelescopeBorder = color.border
                hl.TelescopeSelection = color.select
                hl.TelescopeMatching = { fg = color.main, underline = true }

                hl.LspFloatWinBorder = color.border

                --- notify
                hl.NotifyINFOBorder = color.border
                hl.NotifyERRORBorder = color.border

                hl.FloatermBorder = color.border

                hl.LspFloatWinBorder = color.border
                hl.LspSagaHoverBorder = color.border
                hl.LspSagaRenameBorder = color.border
                hl.LspSagaDefPreviewBorder = color.border
                hl.LspSagaCodeActionBorder = color.border
                hl.LspSagaSignatureHelpBorder = color.border
            end,
        },
    },

    -- theme
    {
        "2nthony/vitesse.nvim",
        dependencies = {
            "tjdevries/colorbuddy.nvim",
        },
        opts = { reverse_visual = true },
    },

    {
        "rcarriga/nvim-notify",
        opts = {
            background_colour = "#000000",
        },
    },

    {
        "NvChad/nvim-colorizer.lua",
        event = "BufRead",
        opts = {
            filetypes = {
                "*",
                typescriptreact = { mode = "background" },
                html = { mode = "background" },
            },
            user_default_options = {
                RGB = true, -- #RGB hex codes
                RRGGBB = true, -- #RRGGBB hex codes
                RRGGBBAA = true, -- #RRGGBBAA hex codes
                AARRGGBB = false, -- 0xAARRGGBB hex codes
                rgb_fn = true, -- CSS rgb() and rgba() functions
                hsl_fn = true, -- CSS hsl() and hsla() functions
                css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
                css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
                names = false,
                -- Available modes for `mode`: foreground, background,  virtualtext
                mode = "background", -- Set the display mode.
                -- Available methods are false / true / "normal" / "lsp" / "both"
                -- True is same as normal
                -- parsers can contain values used in |user_default_options|
                virtualtext = "■",
            },
            -- all the sub-options of filetypes apply to buftypes
            buftypes = {},
        },
    },
}
