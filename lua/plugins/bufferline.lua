local color = require("color")

return {
  {
    -- https://github.com/akinsho/bufferline.nvim
    "akinsho/bufferline.nvim",
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
}
