
local tok, term = pcall(require,"toggleterm")

if not tok then
    return
end


term.setup({
})


local Terminal = require('toggleterm.terminal').Terminal

local lazygit = Terminal:new({ cmd = "lazygit", direction = "float", })
local ra = Terminal:new({ cmd = "ra", direction = "float" })

function _lazygit_toggle()
    lazygit:toggle()
end
function _ra_toggle()
    ra:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ra", "<cmd>lua _ra_toggle()<CR>", { noremap = true, silent = true })