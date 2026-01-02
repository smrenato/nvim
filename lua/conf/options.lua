-- Neovim global configurations

-- Define leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- System clipboard
vim.o.clipboard = 'unnamedplus'

-- use nerd fonts
vim.g.have_nerd_font = true

-- spelling checker
vim.o.spell = true
vim.opt.spelllang = { 'en' }

-- Make all floating windows border rounded

vim.o.winborder = 'rounded'

-- tabs
vim.o.expandtab = true -- Convert tabs to spaces
vim.o.shiftwidth = 4 -- Amount to indent with << and >>
vim.o.tabstop = 4 -- How many spaces are shown per Tab
vim.o.softtabstop = 4 -- How many spaces are applied when pressing Tab
vim.o.smarttab = true
vim.o.smartindent = true
vim.o.autoindent = true -- Keep indentation from previous line

-- Enable break indent
vim.o.breakindent = true

-- Always show relative line numbers
vim.o.number = true
vim.o.relativenumber = true

-- Show line under cursor
vim.o.cursorline = true

-- Store undos between sessions
vim.o.undofile = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.o.mouse = 'a'

-- Don't show the mode, since it's already in the status line
-- vim.opt.showmode = false

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = 'yes'

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.o.confirm = true
