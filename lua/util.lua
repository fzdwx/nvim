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

return M
