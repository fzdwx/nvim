local neo = false

--- https://github.com/tamago324/lir.nvim
local lirb = true

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

local function getTelescopeOptsLir(path)
  return {
    cwd = path,
    search_dirs = { path },
    attach_mappings = function(prompt_bufnr, map)
      local actions = require("telescope.actions")
      local lir_actions = require("lir.actions")

      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local action_state = require("telescope.actions.state")
        local modified_split_command = "split"
        local keepalt = (vim.w.lir_is_float and "") or "keepalt"
        local selection = action_state.get_selected_entry()
        local filename = selection.filename
        if filename == nil then
          filename = selection[1]
        end

        lir_actions.quit()
        local cmd = (vim.api.nvim_buf_get_option(0, "modified") and modified_split_command) or "edit"

        vim.cmd(string.format("%s %s %s", keepalt, cmd, vim.fn.fnameescape(filename)))
      end)
      return true
    end,
  }
end

local function get_keys()
  local fe
  local fE
  if neo then
    fE = function()
      require("neo-tree").float()
    end
    fe = function()
      require("neo-tree.command").execute({ toggle = true, position = "float", dir = vim.loop.cwd() })
    end
  end

  if lirb then
    fE = function()
      require("lir.float").toggle()
    end
    fe = function()
      local ctx = require("lir").get_context()
      require("lir.float").toggle()
    end
  end

  --- return
  return {
    {
      "<leader>fE",
      fE,
      desc = "Show filetree",
    },
    {
      "<leader>fe",
      fe,
      desc = "Show filetree (cwd)",
    },
    { "<leader>e", "<leader>fe", desc = "Show filetree(cwd)", remap = true },
    { "<leader>E", "<leader>fE", desc = "Show filetree", remap = true },
  }
end

return {

  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = neo,
    keys = get_keys(),
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

  {
    "tamago324/lir.nvim",
    enabled = lirb,
    keys = get_keys(),
    config = function()
      local actions = require("lir.actions")
      local mark_actions = require("lir.mark.actions")
      local clipboard_actions = require("lir.clipboard.actions")
      local lir = require("lir")

      local tele_f = function()
        local ctx = lir.get_context()

        require("telescope.builtin").find_files(getTelescopeOptsLir(ctx.dir))
      end

      require("lir").setup({
        show_hidden_files = false,
        ignore = { ".git", "node_modules" }, -- { ".DS_Store", "node_modules" } etc.
        devicons = {
          enable = true,
          highlight_dirname = true,
        },
        mappings = {
          ["l"] = actions.edit,
          ["<cr>"] = actions.edit,
          ["<C-s>"] = actions.split,
          ["v"] = actions.vsplit,
          ["<C-t>"] = actions.tabedit,

          ["<left>"] = actions.up,
          ["<right>"] = actions.edit,
          ["q"] = actions.quit,

          ["A"] = actions.mkdir,
          ["a"] = actions.newfile,
          ["r"] = actions.rename,
          ["@"] = actions.cd,
          ["Y"] = actions.yank_path,
          ["h"] = actions.toggle_show_hidden,
          ["d"] = actions.delete,

          ["J"] = function()
            mark_actions.toggle_mark()
            vim.cmd("normal! j")
          end,
          ["c"] = clipboard_actions.copy,
          ["x"] = clipboard_actions.cut,
          ["p"] = clipboard_actions.paste,
          ["f"] = tele_f,
        },
        float = {
          winblend = 0,
          curdir_window = {
            enable = true,
            highlight_dirname = true,
          },

          -- -- You can define a function that returns a table to be passed as the third
          -- -- argument of nvim_open_win().
          win_opts = function()
            local width = math.floor(vim.o.columns * 0.5)
            local height = math.floor(vim.o.lines * 0.6)
            return {
              border = {
                "+",
                "─",
                "+",
                "│",
                "+",
                "─",
                "+",
                "│",
              },
              width = width,
              height = height,
              row = 1,
              col = math.floor((vim.o.columns - width) / 2),
            }
          end,
        },
        hide_cursor = false,
      })

      vim.api.nvim_create_autocmd({ "FileType" }, {
        pattern = { "lir" },
        callback = function()
          -- use visual mode
          vim.api.nvim_buf_set_keymap(
            0,
            "x",
            "J",
            ':<C-u>lua require"lir.mark.actions".toggle_mark("v")<CR>',
            { noremap = true, silent = true }
          )

          -- echo cwd
          vim.api.nvim_echo({ { vim.fn.expand("%:p"), "Normal" } }, false, {})
        end,
      })
    end,
  },
}
