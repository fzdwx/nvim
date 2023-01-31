-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/util/init.lua
local Util = require("lazyvim.util")
-- https://github.com/folke/lazy.nvim/blob/main/lua/lazy/util.lua
local util = require("lazy.util")
-- https://github.com/folke/lazy.nvim/blob/main/lua/lazy/core/util.lua
-- /home/like/a.out
local corUtil = require("lazy.core.util")
local term = require("term")
local expand = vim.fn.expand
local api = vim.api

local M = {}

M.expand = expand
M.open = util.open
M.root = Util.get_root

M.openCWord = function()
  util.open(expand("<cWORD>"))
end

M.term_cmd_dir = function(cmd, dir, opts)
  term:open(table.concat({ cmd, " ", dir }), opts)
end

M.ranger_path = function(path, opts)
  M.term_cmd_dir("ranger", path, opts)
end

return M
