-- Basic configurations that matter

-- if vim.version.lt('0.12') then
-- 	print'this config is intent do be used on nvim+012'
-- 	return
-- end

-- Set leader key to <space>
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set default theme for nvim+012
vim.cmd.colorscheme 'catppuccin'
vim.cmd.packadd 'nvim.undotree'

-- Enable the new experimental command-line features.
require('vim._core.ui2').enable {}

-- Load all other configurations
-- Quality of life
require 'settings'
require 'autocmds'
require 'keymaps'

-- Install plugins
require 'plugins.lualine'
require 'plugins.dashboard'
require 'plugins.catppuccin'
require 'plugins.oil_nvim'

require 'plugins.fzf_lua'
require 'plugins.mini_nvim'
require 'plugins.conform'
require 'plugins.blink_cmp'

require 'plugins.gitsigns'
require 'plugins.tiny_diagnostics'
require 'plugins.fidget'
require 'plugins.which_key'


-- Load lsp stuff
-- must be loaded after install all plugins
require 'lsp_setup'
