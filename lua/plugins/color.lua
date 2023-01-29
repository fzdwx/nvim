return {
  {
    "2nthony/vitesse.nvim",
    dependencies = {
      "tjdevries/colorbuddy.nvim",
    },
    config = function()
      require("vitesse").setup({
        comment_italisc = true,
      })
      require("lualine").setup({
        optios = {
          theme = "vitesse",
        },
      })
    end,
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "vitesse",
    },
  },

  {
    "rcarriga/nvim-notify",
    opts = {
      background_colour = "#000000",
    },
  },

  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        mode = "tabs",
        separator_style = "padded_slant",
        always_show_bufferline = false,
        show_buffer_close_icons = false,
        show_close_icon = false,
        color_icons = true,
      },
      highlights = {
        separator = {
          fg = "#073642",
          bg = "#002b36",
        },
        separator_selected = {
          fg = "#073642",
        },
        background = {
          fg = "#657b83",
          bg = "#002b36",
        },
        buffer_selected = {
          fg = "#fdf6e3",
          bold = true,
        },
        fill = {
          bg = "#073642",
        },
      },
    },
  },
}
