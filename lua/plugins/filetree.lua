return {

  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      {
        "<leader>fE",
        function()
          require("neo-tree").float()
        end,
        desc = "Show filetree",
      },
      {
        "<leader>fe",
        function()
          require("neo-tree.command").execute({ toggle = true, position = "float", dir = vim.loop.cwd() })
        end,
        desc = "Show filetree (cwd)",
      },
      { "<leader>e", "<leader>fe", desc = "Show filetree(cwd)", remap = true },
      { "<leader>E", "<leader>fE", desc = "Show filetree", remap = true },
    },
    opts = {
      filesystem = {
        bind_to_cwd = false,
        follow_current_file = true,
      },
      window = {
        mappings = {
          ["<tab>"] = "open",
          ["<right>"] = "open",
          ["<left>"] = "navigate_up",
        },
      },
    },
  },
}
