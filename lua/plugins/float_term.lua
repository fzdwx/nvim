local g_map = function(maps)
    for _, map in pairs(maps) do
        vim.api.nvim_set_keymap(map[1], map[2], map[3], map[4])
    end
end

local map_util = require("util").build_map_floatterm_cmd

-- customer term
local keys = function()
    local t_k = map_util("<a-t>", "TERM", "", "Float Termial")
    local ra_k = map_util("<a-r>", "RANGER", "ranger", "Run ranger on float terminal")
    local lazygit_k = map_util("<a-l>", "LAZYGIT", "lazygit", "Run lazygit on float terminal")
    local ll_k = map_util("<leader>ll", "LLAMA", "llama", "Run ll on float terminal")

    -- 这里直接映射了，
    g_map({
        t_k.k2,
        ra_k.k2,
        lazygit_k.k2,
        ll_k.k2,
    })

    -- 这里返回 喂给 whick key
    return {
        ra_k.k1,
        t_k.k1,
        lazygit_k.k1,
        ll_k.k1,
        {
            "<F5>",
            "&ft == \"floaterm\" ? printf('<c-\\><c-n>:FloatermHide<cr>%s', floaterm#terminal#get_bufnr('RUN') == bufnr('%') ? '' : '<F5>') : '<F5>'",
            silent = true,
            expr = true,
            mode = "t",
        },
        {
            "<F5>",
            ':lua require("util").runFile()<cr>',
            silent = true,
            noremap = true,
            mode = "n",
        },
        { "<F5>", '<esc>:lua require("util").runFile()<cr>', mode = "i", silent = true, noremap = true },
    }
end

return {
    -- https://github.com/voldikss/vim-floaterm
    {
        "voldikss/vim-floaterm",
        event = "VimEnter",
        config = function()
            vim.g.floaterm_title = ""
            vim.g.floaterm_width = 0.8
            vim.g.floaterm_height = 0.8
            vim.g.floaterm_autoclose = 0
            vim.g.floaterm_opener = "edit"
            vim.cmd(
                "au BufEnter * if &buftype == 'terminal' | :call timer_start(50, { -> execute('startinsert!') }, { 'repeat': 3 }) | endif"
            )
        end,
        keys = keys(),
    },
}
