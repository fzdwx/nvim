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

map("n", ";", ":", { desc = "Use ; replace :" })

--map("n", "<C-LeftMouse>", function()
map("n", "<leader>a", function()
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

-- windows: sp 上下窗口 sv 左右分屏 sc关闭当前 so关闭其他 s方向切换
map("n", "sv", ":vsp<cr><c-w>w", { desc = "上下切分", noremap = true })
map("n", "sp", ":sp<cr><c-w>w", { noremap = true })
map("n", "sc", ":close<cr>", { noremap = true })
map("n", "so", ":only<cr>", { noremap = true })
map("n", "s<Left>", "<c-w>h", { noremap = true })
map("n", "s<Right>", "<c-w>l", { noremap = true })
map("n", "s<Up>", "<c-w>k", { noremap = true })
map("n", "s<Down>", "<c-w>j", { noremap = true })
map("n", "<c-Space>", "<c-w>w", { noremap = true })
map("n", "s=", "<c-w>=", { noremap = true })
-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +4<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -4<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -4<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +4<cr>", { desc = "Increase window width" })

-- 清空一行
map("n", "<c-u>", "cc<Esc>", { noremap = true })
map("i", "<c-u>", "<Esc>cc", { noremap = true })
map("i", "<c-a>", "<Esc>I", { noremap = true })
map("i", "<c-e>", "<Esc>A", { noremap = true })

-- VISUAL SELECT模式 s-tab tab左右缩进
map("v", "<", "<gv", { noremap = true })
map("v", ">", ">gv", { noremap = true })
map("v", "<s-tab>", "<gv", { noremap = true })
map("v", "<tab>", ">gv", { noremap = true })

map("n", "<m-,>", ":bp<cr>", { noremap = true, silent = true })
map("n", "<m-.>", ":bn<cr>", { noremap = true, silent = true })
map("v", "<m-,>", "<esc>:bp<cr>", { noremap = true, silent = true })
map("v", "<m-.>", "<esc>:bn<cr>", { noremap = true, silent = true })
map("i", "<m-,>", "<esc>:bp<cr>", { noremap = true, silent = true })
map("i", "<m-.>", "<esc>:bn<cr>", { noremap = true, silent = true })

-- 重写Shift + 左右
map("v", "<s-right>", "e", { noremap = true })
map("i", "<s-right>", "<esc>ea", { noremap = true })

-- SHIFT + 方向 选择文本
map("i", "<s-up>", "<esc>vk", { noremap = true })
map("i", "<s-down>", "<esc>vj", { noremap = true })
map("n", "<s-up>", "Vk", { noremap = true })
map("n", "<s-down>", "Vj", { noremap = true })
map("v", "<s-up>", "k", { noremap = true })
map("v", "<s-down>", "j", { noremap = true })
map("n", "<s-left>", "<left>vh", { noremap = true })
map("n", "<s-right>", "vl", { noremap = true })

map("n", "z<Left>", "<C-O>", { noremap = true })
map("n", "z<Right>", "<C-I>", { noremap = true })

map("v", "/", "gcc")

map({ "n", "x" }, "<leader>sr", function()
    require("ssr").open()
end, { desc = "Replace in files" })

vim.keymap.set("n", "<C-a>", require("dial.map").inc_normal(), { noremap = true })
vim.keymap.set("n", "<C-x>", require("dial.map").dec_normal(), { noremap = true })
vim.keymap.set("v", "<C-a>", require("dial.map").inc_visual(), { noremap = true })
vim.keymap.set("v", "<C-x>", require("dial.map").dec_visual(), { noremap = true })
vim.keymap.set("v", "g<C-a>", require("dial.map").inc_gvisual(), { noremap = true })
vim.keymap.set("v", "g<C-x>", require("dial.map").dec_gvisual(), { noremap = true })
