-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local util = require("util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

map("n", "<C-LeftMouse>", function()
  util.openCWord()
end, { desc = "Open Url" })

--
-- telescope 扩展
--  <leader>fp   显示所有 projects
--  <leader>fu   显示历史 undo
--  <leader>fk   显示所有 key map
map("n", "<leader>fp", "<cmd>lua require'telescope'.extensions.projects.projects{}<CR>", { desc = "Find project" })
map("n", "<leader>fu", "<cmd>Telescope undo<CR>", { desc = "Find project" })
map("n", "<leader>fk", "<cmd>lua require'telescope.builtin'.keymaps{}<CR>")

vim.keymap.set("n", "<C-a>", require("dial.map").inc_normal(), { noremap = true })
vim.keymap.set("n", "<C-x>", require("dial.map").dec_normal(), { noremap = true })
vim.keymap.set("v", "<C-a>", require("dial.map").inc_visual(), { noremap = true })
vim.keymap.set("v", "<C-x>", require("dial.map").dec_visual(), { noremap = true })
vim.keymap.set("v", "g<C-a>", require("dial.map").inc_gvisual(), { noremap = true })
vim.keymap.set("v", "g<C-x>", require("dial.map").dec_gvisual(), { noremap = true })
