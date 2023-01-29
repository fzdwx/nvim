-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
    local keys = require("lazy.core.handler").handlers.keys
    ---@cast keys LazyKeysHandler
    -- do not create the keymap if a lazy keys handler exists
    if not keys.active[keys.parse({ lhs, mode = mode }).id] then
        vim.keymap.set(mode, lhs, rhs, opts)
    end
end

--map("n", "gw", "*N")
--map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })
--map("n", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })

map("n", "<leader>fp", "<cmd>lua require'telescope'.extensions.projects.projects{}<CR>", { desc = "Find project" })