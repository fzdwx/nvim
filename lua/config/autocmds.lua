-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
local cmd = vim.cmd

cmd("set noswapfile")

cmd([[au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif]])
cmd([[au BufEnter * if &buftype == '' && &readonly == 1 | set buftype=acwrite | set noreadonly | endif]])
cmd([[
    au FileType * try | silent! loadview | catch | endtry
    au BufLeave,BufWinLeave * silent! mkview
]])
