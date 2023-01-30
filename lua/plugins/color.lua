local st_i = {
  italic = true,
}

local color = {
  main = "#61f1ca",
  primary = "#4d9375",
  foreground = "#c8c5b8",
  activeForeground = "#bebaab",
  secondaryForeground = "#83827d",
  ignored = "#383837",
  whitea = "#ffffff",

  greena = "#5cbb5e",
  br_greena = "#a7df78",

  reda = "#c98a7d",
  redb = "#cb7676",
  redc = "#fc5d7c",
  bg_reda = "#ff6077",

  pura = "#8859e0",
  purb = "#a277ff",
  purc = "#a394f0",

  bluea = "#7287fd",
  blueb = "#82e2ff",

  orga = "#FFC66D",
}

local theme = {
  functionName = color.orga,
  field = color.purc, -- "#73daca"
  type = color.blueb,
  keyword = color.main,
  keywordFunc = color.purb,
  comment = color.greena,
  string = color.orga,
  border = color.main,
  normal = color.whitea,
}

return {
  -- https://github.com/folke/tokyonight.nvim/blob/main/lua/lualine/themes/tokyonight.lua
  -- https://github.com/folke/tokyonight.nvim/blob/main/extras/lua/tokyonight_storm.lua
  {
    "folke/tokyonight.nvim",
    lazy = true,
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
        hl.String = { fg = theme.string }
        hl.Keyword = { fg = theme.keyword }
        hl.Function = { fg = theme.functionName }
        hl.Comment = { fg = theme.comment, style = st_i }
        hl.PreProc = { fg = color.bluea }

        hl.Cursor = { bg = "", fg = "#24283b" }
        hl.CursorLine = { bg = "" }
        hl.CursorLineNr = { fg = color.activeForeground }
        hl.CursorColumn = { bg = "" }
        hl.lCursor = { bg = "", fg = "#24283b" }

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
        hl.Operator = { fg = color.purc }
        hl["@field"] = { fg = theme.field }
        hl["@property"] = { fg = theme.field }
        hl["@parameter"] = { fg = "" }

        --- notify
        hl.NotifyINFOBorder = { fg = theme.border }
        hl.NotifyERRORBorder = { fg = color.bg_reda }

        --- neotree color style
        hl.NeoTreeNormal = { fg = theme.normal }
        hl.NeoTreeFloatBorder = { fg = theme.border }
        hl.NeoTreeRootName = { fg = color.main }
      end,
    },
  },

  {
    "rcarriga/nvim-notify",
    opts = {
      background_colour = "#000000",
    },
  },

  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({})
    end,
    keys = {
      {
        "cat",
        function()
          require("colorizer").attach_to_buffer(0, { mode = "background", css = true })
        end,
        desc = "Attach colorizer to buffer",
      },
    },
  },
}
