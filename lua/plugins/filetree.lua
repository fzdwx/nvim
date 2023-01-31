return {
  -- https://github.com/nvim-tree/nvim-tree.lua
  {
    "nvim-tree/nvim-tree.lua",
    tag = "nightly", -- optional, updated every week. (see issue #1193)
    config = function()
      local nvim_tree = require("nvim-tree")
      nvim_tree.setup({
        sort_by = "case_sensitive",
        actions = {
          open_file = {
            window_picker = { enable = false },
          },
        },
        view = {
          mappings = {
            list = {
              { key = ".", action = "cd" },
              { key = "<BS>", action = "dir_up" },
              { key = "<Esc>", action = "close" },
              { key = "<Tab>", action = "expand" },
              { key = "<Right>", action = "cd" },
              { key = "<Left>", action = "dir_up" },
              { key = ")", action = "next_git_item" },
              { key = "(", action = "prev_git_item" },
              { key = ">", action = "next_diag_item" },
              { key = "<", action = "prev_diag_item" },
              { key = "?", action = "toggle_help" },
              { key = "a", action = "create" },
            },
          },
          float = {
            enable = true,
            open_win_config = function()
              local columns = vim.o.columns
              local lines = vim.o.lines
              local width = math.max(math.floor(columns * 0.5), 50)
              local height = math.max(math.floor(lines * 0.5), 20)
              local left = math.ceil((columns - width) * 0.5)
              local top = math.ceil((lines - height) * 0.5 - 2)
              return { relative = "editor", border = "rounded", width = width, height = height, row = top, col = left }
            end,
          },
        },
        update_focused_file = {
          enable = true,
          update_root = false,
          ignore_list = {},
        },
        renderer = {
          group_empty = true,
          indent_markers = { enable = true },
          icons = {
            git_placement = "after",
            webdev_colors = true,
            glyphs = {
              git = {
                unstaged = "~",
                staged = "✓",
                unmerged = "",
                renamed = "+",
                untracked = "?",
                deleted = "",
                ignored = " ",
              },
            },
          },
        },
        filters = { dotfiles = true },
        diagnostics = {
          enable = true,
          show_on_dirs = true,
          debounce_delay = 50,
          icons = { hint = "", info = "", warning = "", error = "" },
        },
      })

      vim.g.nvim_tree_firsttime = 1
      vim.cmd("hi! NvimTreeCursorLine cterm=NONE ctermbg=238")
      vim.cmd("hi! link NvimTreeFolderIcon NvimTreeFolderName")
    end,
    keys = {
      {
        "<leader>e",
        'g:nvim_tree_firsttime != 1 ? ":NvimTreeToggle<cr>" : ":let g:nvim_tree_firsttime = 0<cr>:NvimTreeToggle .<cr>"',
        mode = "n",
        silent = true,
        noremap = true,
        expr = true,
        desc = "Show FileTree",
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
  },
}
