return {

  -- dashboard
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      local dashboard = require("alpha.themes.dashboard")
      opts.section.buttons.val = {
        dashboard.button("p", " " .. "Open project", "<cmd>lua require('telescope').extensions.projects.projects()<CR>"),
        dashboard.button("e", " " .. "New file", "<cmd>ene <BAR> startinsert<cr>"),
        dashboard.button("f", " " .. "Find file", "<cmd>cd $HOME/Projects | Telescope find_files<cr>"),
        dashboard.button("l", "鈴" .. "Lazy", "<cmd>Lazy<cr>"),
        dashboard.button("m", " " .. "Mason", "<cmd>Mason<cr>"),
        dashboard.button("r", " " .. "Recent files", "<CMD>Telescope oldfiles<cr>"),
        dashboard.button("s", " " .. "Settings", ":e $MYVIMRC | :cd %:p:h | Telescope file_browser<cr>"),
        dashboard.button("q", " " .. "Quit", "<cmd>qa<cr>"),
      }
      opts.config.opts.setup = function()
        vim.api.nvim_create_autocmd("User", {
          pattern = "AlphaReady",
          desc = "disable tabline for alpha",
          callback = function()
            vim.opt.showtabline = 0
          end,
        })
        vim.api.nvim_create_autocmd("BufUnload", {
          buffer = 0,
          desc = "enable tabline after alpha",
          callback = function()
            vim.opt.showtabline = 2
          end,
        })
      end
    end,
  },
}
