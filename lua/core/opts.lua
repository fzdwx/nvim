---
--- the neovim options
--- Created by like.
--- DateTime: 9/28/22 8:16 PM
---

--[[ opts.lua ]]
local opt = vim.opt -- with vim.opt we can set global, window and buffer settings, acting like :set in vimscript
local set = vim.opt
local cmd = vim.api.nvim_command

opt.laststatus = 3 -- global statusline
opt.showmode = false

opt.title = true
opt.clipboard = "unnamedplus"
opt.cursorline = true

-- ident
vim.cmd([[
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
]])

-- Spell check:
vim.cmd([[
set spelllang=en_us
]])

-- turn off macro reording
vim.cmd([[
map q <Nop>
]])

opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

opt.number = true -- bool: Show line numbers
opt.relativenumber = true -- bool: Show relative line numbers
opt.scrolloff = 4 -- int:  Min num lines of context
opt.signcolumn = "yes" -- str:  Show the sign column
opt.numberwidth = 4 -- gutter width
set.cursorline = true -- display cursor line
set.cursorlineopt = 'number' --

-- [[ Filetypes ]]
opt.encoding = 'utf8' -- str:  String encoding to use
opt.fileencoding = 'utf8' -- str:  File encoding to use

-- [[ Theme ]]
opt.syntax = "ON" -- str:  Allow syntax highlighting
opt.termguicolors = true -- bool: If term supports ui color then enable

-- [[ Search ]]
opt.ignorecase = true -- bool: Ignore case in search patterns
opt.smartcase = true -- bool: Override ignorecase if search contains capitals
opt.incsearch = true -- bool: Use incremental search
opt.hlsearch = false -- bool: Highlight search matches

-- [[ Whitespace ]]
opt.expandtab = true -- bool: Use spaces instead of tabs
opt.shiftwidth = 4 -- num:  Size of an indent
opt.softtabstop = 4 -- num:  Number of spaces tabs count for in insert mode
opt.tabstop = 4 -- num:  Number of spaces tabs count for

-- [[ Splits ]]
opt.splitright = true -- bool: Place new window to right of current one
opt.splitbelow = true -- bool: Place new window below the current one