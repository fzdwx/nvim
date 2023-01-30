local color = {
  comment = "#629755",
  string = "#61f1ca",
  functionName = "#ffca85",
  border = "#1d202f",
  border_highlight = "#29a4bd",
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
      end,
      on_highlights = function(hl, c)
        hl.String = {
          fg = color.string,
        }
        hl.Keyword = {
          fg = color.keyword,
        }
        hl.Function = {
          fg = color.functionName,
        }
        hl.Comment = {
          fg = color.comment,
        }
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
