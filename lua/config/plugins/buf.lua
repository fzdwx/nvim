local M = {}

local options = {
    mode = "buffers",
    numbers = "none",
    close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
    right_mouse_command = "vert sbuffer %d", -- can be a string | function, see "Mouse actions"
    left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
    middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
    diagnostics = "nvim_lsp",
    offsets = {
        {
            filetype = "undotree",
            text = "Undotree",
            highlight = "PanelHeading",
            padding = 1,
        },
        {
            filetype = "NvimTree",
            text = "Explorer",
            highlight = "PanelHeading",
            padding = 1,
        },
        {
            filetype = "DiffviewFiles",
            text = "Diff View",
            highlight = "PanelHeading",
            padding = 1,
        },
        {
            filetype = "flutterToolsOutline",
            text = "Flutter Outline",
            highlight = "PanelHeading",
        },
        {
            filetype = "packer",
            text = "Packer",
            highlight = "PanelHeading",
            padding = 1,
        },
    },
    hover = {
        enabled = true, -- requires nvim 0.8+
        delay = 200,
        reveal = { "close" },
    },
}

function M.setup(buf)
    buf.setup({
        options = options
    })
end

return M