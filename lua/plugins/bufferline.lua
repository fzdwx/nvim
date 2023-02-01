local color = require("color")

return {
    {
        -- https://github.com/akinsho/bufferline.nvim
        "akinsho/bufferline.nvim",
        enabled = false,
    },

    -- https://github.com/fzdwx/bufline.nvim
    {
        "fzdwx/bufline.nvim",
        -- dir = "~/IdeaProjects/bufline.nvim",
        event = "BufReadPre",
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
