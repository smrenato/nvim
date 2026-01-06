-- Define leader key before everything
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- Setup all configurations before load any plugins
require('conf.options')
require('conf.autocmds')
require('conf.keymaps')

-- Setup install plugins
require('plugins')

-- Load LSP
require('core.lsp')
require('core.extras')
