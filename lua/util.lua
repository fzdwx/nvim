-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/util/init.lua
local Util = require("lazyvim.util")
-- https://github.com/folke/lazy.nvim/blob/main/lua/lazy/util.lua
local util = require("lazy.util")
-- https://github.com/folke/lazy.nvim/blob/main/lua/lazy/core/util.lua
-- /home/like/a.out
local corUtil = require("lazy.core.util")
local expand = vim.fn.expand

local M = {}

M.expand = expand
M.open = util.open
M.root = Util.get_root

M.openCWord = function()
  util.open(expand("<cWORD>"))
end

-- float func: 存在对应名称的窗口则toggle，否则新建
---@param cmd string 要运行的命令
---@param name string 窗口的名称
M.float = function(name, cmd)
  if vim.fn["floaterm#terminal#get_bufnr"](name) ~= -1 then
    vim.cmd(string.format('exec "FloatermToggle %s"', name))
  else
    vim.cmd(string.format("FloatermNew --name=%s %s", name, cmd))
  end
end

-- 根据文件类型 运行对应的命令
function M.runFile()
  vim.cmd("w")
  local ft = vim.api.nvim_eval("&ft")
  local run_cmd = {
    javascript = "node",
    typescript = "ts-node",
    html = "google-chrome-stable",
    python = "python",
    go = "go run",
    sh = "bash",
    lua = "lua",
  }
  if run_cmd[ft] then
    M.float("RUN", run_cmd[ft] .. " %")
  elseif ft == "markdown" then
    M.float("RUN", "glow %")
  elseif ft == "java" then
    M.float("RUN", "javac % && java %<")
  elseif ft == "c" then
    M.float("RUN", "gcc % -o %< && ./%< && rm %<")
  end
end

--- 映射浮动终端的命令
M.build_map_floatterm_cmd = function(key, name, cmd, desc)
  return {
    k1 = {
      key,
      string.format(":lua require('util').float('%s', '%s')<cr>", name, cmd),
      mode = "n",
      silent = true,
      noremap = true,
      desc = desc,
    },

    k2 = {
      "t",
      key,
      "&ft == \"floaterm\" ? printf('<c-\\><c-n>:FloatermHide<cr>%s', floaterm#terminal#get_bufnr('"
        .. name
        .. "') == bufnr('%') ? '' : '"
        .. key
        .. "') : '"
        .. key
        .. "'",
      { silent = true, expr = true },
    },
  }
end

return M
