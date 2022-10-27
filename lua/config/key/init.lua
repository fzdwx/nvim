---
--- 通用 key mapping
--- Created by like.
--- DateTime: 9/28/22 8:44 PM
---

-- Functional wrapper for mapping custom keybindings
-- mode (as in Vim modes like Normal/Insert mode)
-- lhs (the custom keybinds you need)
-- rhs (the commands or existing keybinds to customise)
-- opts (additional options like <silent>/<noremap>, see :h map-arguments for more info on it)
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local nnoremap = function(lhs, rhs, silent)
    vim.api.nvim_set_keymap("n", lhs, rhs, { noremap = true, silent = silent })
end

local inoremap = function(lhs, rhs, silent)
    vim.api.nvim_set_keymap("i", lhs, rhs, { noremap = true, silent = silent })
end

local snoremap = function(lhs, rhs, silent)
    vim.api.nvim_set_keymap("s", lhs, rhs, { noremap = true, silent = silent })
end

local vnoremap = function(lhs, rhs)
    vim.api.nvim_set_keymap("v", lhs, rhs, { noremap = true })
end


vim.cmd("noremap ; :")
vim.cmd("map <C-q> :qa!<CR>")
--vim.cmd("map Q :q<CR>")

-- Save and exit
map("n", "<C-s>", ":w<CR>")

-- Window navigation
map("n", "<C-j>", "<C-w>j<C-w>")
map("n", "<C-h>", "<C-w>h<C-w>")
map("n", "<C-k>", "<C-w>k<C-w>")
map("n", "<C-l>", "<C-w>l<C-w>")

-- Telescope
map("n", "<leader>ff", ":lua require('telescope.builtin').find_files()<cr>")
map("n", "<leader>/", ":lua require'telescope.builtin'.current_buffer_fuzzy_find{}<cr>")
map("n", "<leader>fm", ":Telescope media_files<cr>")
map("n", "<leader>fg", ":lua require('telescope.builtin').live_grep()<cr>")
map("n", "<leader>fb", ":lua require('telescope.builtin').buffers()<cr>")
map("n", "<leader>fh", ":lua require('telescope.builtin').help_tags()<cr>")
map("n", "<leader>fd", ":lua require('telescope.builtin').diagnostics()<cr>")
map("n", "<leader>fs", ":lua require('telescope.builtin').lsp_workspace_symbols()<cr>")
map("n", "<leader>fr", ":lua require('telescope.builtin').lsp_references()<cr>")
map("n", "<leader>fi", ":lua require('telescope.builtin').lsp_implementations()<cr>")
map("n", "<leader>fl", ":lua require('telescope.builtin').treesitter()<cr>")
map("n", "<leader>fk", ":lua require('telescope.builtin').keymaps()<cr>")
map("n", "<leader>fp", ":Telescope projects<cr>")

map("n", "<leader>fc", ":lua require('telescope.builtin').commands()<cr>")
map("n", "<leader>fch", ":lua require('telescope.builtin').command_history()<cr>")
map("n", "<leader>fsh", ":lua require('telescope.builtin').search_history()<cr>")
map("n", "<leader>fmp", ":lua require('telescope.builtin').man_pages()<cr>")
map("n", "<leader>fgc", ":lua require('telescope.builtin').git_commits()<cr>")
map("n", "<leader>fgb", ":lua require('telescope.builtin').git_branches()<cr>")

-- toogle term
map("n", "<F12>", ":ToggleTerm<cr>")
map("n", "<C-\\>", ":ToggleTerm direction=float<cr>")

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- bufferline 左右Tab切换
map("n", "<C-[>", ":BufferLineCyclePrev<CR>")
map("n", "<C-]>", ":BufferLineCycleNext<CR>")

vim.cmd([[
" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy
" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P
]])


-- nvim tree key map
map("n","<F1>",":NvimTreeFindFileToggle<cr>")

-- 移动 到行首行尾
map("n","<C-a>","<HOME>")
map("n","<C-e>","<END>")
map("n","A","I")
map("n","E","A")


-- Crates Nvim
vim.cmd([[
nnoremap <silent> <leader>ct :lua require('crates').toggle()<cr>
nnoremap <silent> <leader>cr :lua require('crates').reload()<cr>
nnoremap <silent> <leader>cv :lua require('crates').show_versions_popup()<cr>
nnoremap <silent> <leader>cf :lua require('crates').show_features_popup()<cr>
nnoremap <silent> <leader>cd :lua require('crates').show_dependencies_popup()<cr>
nnoremap <silent> <leader>cu :lua require('crates').update_crate()<cr>
vnoremap <silent> <leader>cu :lua require('crates').update_crates()<cr>
nnoremap <silent> <leader>ca :lua require('crates').update_all_crates()<cr>
nnoremap <silent> <leader>cU :lua require('crates').upgrade_crate()<cr>
vnoremap <silent> <leader>cU :lua require('crates').upgrade_crates()<cr>
nnoremap <silent> <leader>cA :lua require('crates').upgrade_all_crates()<cr>
nnoremap <silent> <leader>cH :lua require('crates').open_homepage()<cr>
nnoremap <silent> <leader>cR :lua require('crates').open_repository()<cr>
nnoremap <silent> <leader>cD :lua require('crates').open_documentation()<cr>
nnoremap <silent> <leader>cC :lua require('crates').open_crates_io()<cr>
]])


-- Use alt + hjkl to resize windows
nnoremap("<M-j>", ":resize -2<CR>")
nnoremap("<M-k>", ":resize +2<CR>")
nnoremap("<M-h>", ":vertical resize -2<CR>")
nnoremap("<M-l>", ":vertical resize +2<CR>")

-- Escape redraws the screen and removes any search highlighting.
nnoremap("<esc>", ":noh<return><esc>")

-- Easy CAPS
inoremap("<c-u>", "<ESC>viwUi")

-- TAB in normal mode will move to text buffer
--nnoremap("<TAB>", ":bnext<CR>")
-- SHIFT-TAB will go back
--nnoremap("<S-TAB>", ":bprevious<CR>")


-- Lsp
-- ctrl + b go do definition
nnoremap("<C-b>", "<cmd>lua vim.lsp.buf.definition()<CR>", true)
--nnoremap("gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", true)
--nnoremap("gr", "<cmd>LspTrouble lsp_references<CR>", true)
--nnoremap("gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", true)
nnoremap("<leader>q", "<cmd>lua require'rust-tools'.hover_actions.hover_actions()<CR>", true)
--nnoremap("<leader>a", "<cmd>lua require'rust-tools'.code_action_group.code_action_group()<CR>", true)
--vnoremap("<leader>a", "<cmd>RustHoverRange<CR>")
--

nnoremap("q",":q<cr>",true)
