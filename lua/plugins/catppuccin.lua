vim.pack.add {
  {
    src = "https://github.com/catppuccin/nvim",
    name = "catppuccin"
  }
}

local catppuccin = require "catppuccin"

-- if all have done
vim.cmd.colorscheme'catppuccin-mocha'
