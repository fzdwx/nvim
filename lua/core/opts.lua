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
setlocal noswapfile
set bufhidden=hide
]])

-- 设置python3对应的目录，你可以手动 export PYTHON=$(which python3) 到你的终端配置中
vim.cmd([[
    let g:python3_host_prog = $PYTHON
]])

-- 设置命令提示 唯一标识 共享剪贴板
vim.cmd([[
    set showcmd
    set encoding=utf-8
    set wildmenu
    set pumheight=10
    set conceallevel=0
    set clipboard=unnamed
    set clipboard+=unnamedplus
]])

-- 搜索高亮 空格+回车 去除匹配高亮 延迟
vim.cmd([[
    set hlsearch
    set showmatch
    noremap \ :nohlsearch<CR>
    set incsearch
    set inccommand=
    set ignorecase
    set smartcase
    set timeoutlen=400
]])

-- 设置正常删除 光标穿越行
vim.cmd([[
    set backspace=indent,eol,start
    set whichwrap+=<,>,h,
]])

-- 设置鼠标移动
vim.cmd([[
    set mouse=a
    set selection=exclusive
]])

-- 错误无提示音 去除屏幕闪烁
vim.cmd([[
    set vb
    set t_vb=""
    set t_ut=""
    set hidden
]])

-- 缩进对齐
vim.cmd([[
    set autoindent
    set smartindent
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set smarttab
    set expandtab
]])

-- 不自动备份 不换行
vim.cmd([[
    set nobackup
    set noswapfile
    set nowrap
]])

-- 光标回到上次位置
vim.cmd([[ au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif ]])

-- 持久化撤销
vim.cmd([[
    set undofile
    set undodir=~/.config/nvim/cache/undodir
]])
-- vim保存1000条文件记录
vim.cmd([[ set viminfo=!,'10000,<50,s10,h ]])

-- 折叠
vim.cmd([[
    set foldenable
    set foldmethod=manual
]])

-- show
vim.cmd([[
    set cmdheight=1
    set updatetime=300
    set shortmess+=cI
    set scrolloff=5
    set noshowmode
    set nu
    set numberwidth=2
    set cul
    set signcolumn=yes
    let &t_SI.="\e[5 q"
    let &t_EI.="\e[1 q"
    set fillchars=stlnc:#
]])

-- 提示多余空格和TODO
vim.cmd([[
    hi ErrSpace ctermbg=238
    " autocmd BufWinEnter * syn match ErrSpace /\s\+$\| \+\ze\t\+\|\t\+\zs \+/
    autocmd BufWinEnter * syn match Todo /TODO\(:.*\)*/
]])

-- turn off macro reording
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

-- theme
vim.cmd('colorscheme aura')