return {

  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },

  -- LSP keymaps
  {
    "neovim/nvim-lspconfig",
    init = function()
      local lazyvim_keymaps = require("lazyvim.plugins.lsp.keymaps")
      local format = require("lazyvim.plugins.lsp.format").format

      require("lazyvim.plugins.lsp.keymaps")._keys = {
        {
          "<leader>ca",
          "<cmd>Lspsaga code_action<cr>",
          desc = "Show code action",
          mode = { "n", "v" },
          has = "codeAction",
        },
        { "<leader>ci", "<cmd>Lspsaga incoming_calls<cr>", desc = "In call hierarchy" },
        { "<leader>co", "<cmd>Lspsaga outgoing_calls<cr>", desc = "Out call hierarchy" },
        { "<leader>cr", lazyvim_keymaps.rename, expr = true, desc = "Rename", has = "rename" },
        { "<leader>cf", format, desc = "Format Document", has = "documentFormatting" },
        { "<leader>cf", format, desc = "Format Range", mode = "v", has = "documentRangeFormatting" },
        { "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>", desc = "Show line diagnostics" },
        { "<leader>sb", "<cmd>Lspsaga show_line_diagnostics<CR>", desc = "Show line diagnostics" },
        { "<leader>sc", "<cmd>Lspsaga show_buf_diagnostics<CR>", desc = "Show buf diagnostics" },

        { "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", desc = "Diagnostic jump prev. <C-o> go back" },
        { "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", desc = "Diagnostic jump next. <C-o> go back" },

        { "<C-p>", "<cmd>Lspsaga hover_doc ++keep<cr>", desc = "Show hover doc" },
        { "<leader>o", "<cmd>Lspsaga outline<CR>", desc = "Show outline" },

        { "gh", "<cmd>Lspsaga lsp_finder<CR>", desc = "Find the symbol's definition. <C-t> go back" },
        { "gd", "<cmd>Lspsaga goto_definition<cr>", desc = "Goto Definition." },
        { "gpd", "<cmd>Lspsaga peek_definition<cr>", desc = "Peek definition." },
      }
    end,
  },

  {
    "glepnir/lspsaga.nvim",
    event = "BufRead",
    config = function()
      require("lspsaga").setup({
        definition = {
          edit = "o",
        },
        symbol_in_winbar = {
          enable = false,
        },
      })
    end,
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
  },
}
