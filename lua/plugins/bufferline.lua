local color = require("color")

return {
  {
    -- https://github.com/akinsho/bufferline.nvim
    "akinsho/bufferline.nvim",
    enabled = false,
    opts = {
      options = {
        mode = "tabs",
        separator_style = "padded_slant",
        always_show_bufferline = false,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        color_icons = true,
      },
    },
  },

  {
    "yaocccc/nvim-lines.lua",
    event = "BufReadPre",
    config = function()
      vim.g.powerline_symbols = { light_right = "", dark_right = "", light_left = "", dark_left = "" }
      vim.g.line_statusline_enable = 0
      vim.g.line_powerline_enable = 1
      vim.g.line_nerdfont_enable = 1
      vim.g.line_unnamed_filename = "~"
      vim.g.line_hl = { none = "NONE", light = "NONE", dark = "NONE", ["break"] = "244", space = 238 }
      -- vim.cmd("au VimEnter * hi VimLine_Dark ctermfg=245")
      -- vim.cmd("au VimEnter * hi VimLine_Buf_Dark ctermfg=245")
      -- vim.cmd("au VimEnter * hi VimLine_Other ctermfg=245")
    end,
  },
}
