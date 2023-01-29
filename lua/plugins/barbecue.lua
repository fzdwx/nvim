local spec = {
  "utilyre/barbecue.nvim",
  version = "*",
  dependencies = {
    "neovim/nvim-lspconfig",
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons", -- optional dependency
  },
}

-- triggers CursorHold event faster
vim.opt.updatetime = 200

function spec.config()
  require("barbecue").setup({
    create_autocmd = false, -- prevent barbecue from updating itself automatically
  })
end

vim.api.nvim_create_autocmd({
  "WinScrolled",
  "BufWinEnter",
  "CursorHold",
  "InsertLeave",

  -- include these if you have set `show_modified` to `true`
  "BufWritePost",
  "TextChanged",
  "TextChangedI",
}, {
  group = vim.api.nvim_create_augroup("barbecue.updater", {}),
  callback = function()
    require("barbecue.ui").update()
  end,
})

return spec
