-- Set leader key to <space>
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set default theme for nvim+012
vim.cmd.colorscheme 'catppuccin'
vim.cmd.packadd 'nvim.undotree'

-- Load all other configurations
-- Quality of life
require 'settings'

-- Plugins
require 'plugins.lualine'
require 'plugins.dashboard'
require 'plugins.catppuccin'
require 'plugins.oil_nvim'

-- require 'plugins.fzf_lua'
require 'plugins.fff' -- alternative to fzf
require 'plugins.mini_nvim'
require 'plugins.conform'
require 'plugins.blink_cmp'
require 'plugins.treesitter'

require 'plugins.gitsigns'
require 'plugins.tiny_diagnostics'
require 'plugins.fidget'
require 'plugins.which_key'

-- Load lsp stuff
-- must be loaded after install all plugins
require 'lsp_setup'
