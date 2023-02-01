-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
local cmd = vim.cmd
local create_cmd = vim.api.nvim_create_user_command
local util = require("util")

cmd("set noswapfile")

cmd([[au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif]])
cmd([[au BufEnter * if &buftype == '' && &readonly == 1 | set buftype=acwrite | set noreadonly | endif]])
cmd([[
    au FileType * try | silent! loadview | catch | endtry
    au BufLeave,BufWinLeave * silent! mkview
]])

create_cmd("Upper", function(opts)
    print(string.upper(opts.args))
end, { nargs = 1 })

--- term :Float ranger
create_cmd("Float", function(opts)
    util.float("Float_Term", opts.args)
end, { nargs = 1 })

create_cmd("Reloadcfg", function()
    cmd([[:source $MYVIMRC]])
end, {})
