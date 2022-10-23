---
--- https://github.com/nvim-telescope/telescope.nvim config
--- Created by like.
--- DateTime: 9/28/22 9:31 PM
---

local present, telescope = pcall(require, "telescope")

if not present then
    return
end

local previewers = require "telescope.previewers"
local sorters = require "telescope.sorters"

local options = {
    defaults = {
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--hidden",
            "--glob=!.git/",
        },
        prompt_prefix = " 🔍 ",
        selection_caret = " ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "descending",
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {
                prompt_position = "top",
                preview_width = 0.55,
                results_width = 0.8,
            },
            vertical = {
                mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
        },
        file_sorter = sorters.get_fuzzy_file,
        generic_sorter = sorters.get_generic_fuzzy_sorter,
        file_previewer = previewers.vim_buffer_cat.new,
        grep_previewer = previewers.vim_buffer_vimgrep.new,
        qflist_previewer = previewers.vim_buffer_qflist.new,
        file_ignore_patterns = { ".git/", "node_modules" },
        path_display = { "smart" },
        winblend = 0,
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        color_devicons = true,
        set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
        mappings = {
            n = { ["q"] = require("telescope.actions").close },
        },
    },

    extensions = {
     fzf = {
       fuzzy = true, -- false will only do exact matching
       override_generic_sorter = true, -- override the generic sorter
       override_file_sorter = true, -- override the file sorter
       case_mode = "smart_case", -- or "ignore_case" or "respect_case"
     },
   },
}

telescope.setup(options)


require("telescope").load_extension "projects"
require("telescope").load_extension "fzf"

---
--- project nvim
---
local status_ok, project = pcall(require, "project_nvim")
if not status_ok then
    return
end
project.setup({

    -- detection_methods = { "lsp", "pattern" }, -- NOTE: lsp detection will get annoying with multiple langs in one project
    detection_methods = { "pattern" },

    -- patterns used to detect root dir, when **"pattern"** is in detection_methods
    patterns = { ".git", "Makefile", "package.json" },
})
