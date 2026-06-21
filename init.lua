-- font: BlexMono Nerd Font Mono
-- [https://www.programmingfonts.org/#plex-mono] derived from IBM plex

-- font: lilex Nerd Font Mono
-- [https://www.programmingfonts.org/#lilex] IBM plex with ligatures

-- Set leader key to <space>
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set default theme for nvim+012
vim.cmd.colorscheme 'catppuccin'
vim.cmd.packadd 'nvim.undotree'

-- UI2 config if 0.12.0
if vim.version.range('0.12.0 - 1.0.0'):has(vim.version()) then
    require('vim._core.ui2').enable {}
else
    print 'This config is intent to be used on neovim 0.12+'
    return
end

local disabled_builtins = {
    -- network / file browsing
    'netrw',
    'netrwPlugin',

    -- match helpers
    'matchit',
    'matchparen',

    -- archive handlers
    'gzip',
    'zip',
    'zipPlugin',
    'tar',
    'tarPlugin',

    -- html / tohtml
    '2html_plugin',
    'tohtml',

    'compiler',
    'getscript',
    'getscriptPlugin',
    'vimball',
    'vimballPlugin',
    'rrhelper',
}

for _, name in ipairs(disabled_builtins) do
    local var = 'loaded_' .. name
    vim.g[var] = 1
end

-- Load all other configurations
-- Quality of life
require 'settings'

-- Plugins
require 'plugins.lualine'
require 'plugins.dashboard'
require 'plugins.catppuccin'
-- require 'plugins.oil_nvim'

-- require 'plugins.fzf_lua'
require 'plugins.fff' -- alternative to fzf
require 'plugins.mini_nvim' -- mini explorer
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
