return {
  {
    "f-person/git-blame.nvim",
    event = "BufRead",
    config = function()
      vim.g.gitblame_message_template = "<author>, <date> - <summary>"
      vim.g.gitblame_date_format = "%r | %Y-%m-%d %H:%M:%S"
      vim.g.gitblame_message_when_not_committed = "Oh please, commit this !"
    end,
  },
}
