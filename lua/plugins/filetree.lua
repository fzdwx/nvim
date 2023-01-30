local function getTelescopeOpts(state, path)
  return {
    cwd = path,
    search_dirs = { path },
    attach_mappings = function(prompt_bufnr, map)
      local actions = require("telescope.actions")
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local action_state = require("telescope.actions.state")
        local selection = action_state.get_selected_entry()
        local filename = selection.filename
        if filename == nil then
          filename = selection[1]
        end
        -- any way to open the file without triggering auto-close event of neo-tree?
        require("neo-tree.sources.filesystem").navigate(state, state.path, filename)
      end)
      return true
    end,
  }
end

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
        bind_to_cwd = true,
        follow_current_file = true,
        window = {
          mappings = {
            ["f"] = "telescope_find",
            ["g"] = "telescope_grep",
          },
        },
        commands = {
          telescope_find = function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            require("telescope.builtin").find_files(getTelescopeOpts(state, path))
          end,
          telescope_grep = function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            require("telescope.builtin").live_grep(getTelescopeOpts(state, path))
          end,
        },
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
