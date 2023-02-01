local color = require("color")

return {
    {
        -- https://github.com/akinsho/bufferline.nvim
        "akinsho/bufferline.nvim",
        enabled = false,
    },
    {
        "fzdwx/bufline.nvim",
        event = "VeryLazy",
        config = function()
            local buf = require("bufline")
            buf.setup({
                windowCount = function(index)
                    return ""
                end,
            })
        end,
    },
}
