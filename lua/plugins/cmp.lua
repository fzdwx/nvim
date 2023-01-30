return {
  {
    "onsails/lspkind.nvim",
    config = function()
      require("lspkind").init({
        symbol_map = require("icons").kind,
      })
    end,
  },

  -- 修改 format
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local types = require("cmp.types")
      local str = require("cmp.utils.str")
      local lspkind = require("lspkind")

      opts.formatting = {
        format = lspkind.cmp_format({
          maxwidth = 50,
          ellipsis_char = "...",
          before = function(entry, vim_item)
            -- Get the full snippet (and only keep first line)
            local word = entry:get_insert_text()
            if entry.completion_item.insertTextFormat == types.lsp.InsertTextFormat.Snippet then
              word = vim.lsp.util.parse_snippet(word)
            end
            word = str.oneline(word)

            if
              entry.completion_item.insertTextFormat == types.lsp.InsertTextFormat.Snippet
              and string.sub(vim_item.abbr, -1, -1) == "~"
            then
              word = word .. "~"
            end
            vim_item.abbr = word

            return vim_item
          end,
        }),
      }
    end,
  },
}
