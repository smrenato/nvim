-- routine update before packadd
-- require update plugins

gh = function(repo)
    return 'https://github.com/' .. repo
end

cb = function(repo)
    return 'https://codeberg.org/' .. repo
end

map = function(mode, keys, func, opts)
    vim.keymap.set(mode, keys, func, opts)
end

-- which pugins has to be activated
require('plugins.colorschemes')
require('plugins.guess_indent')
require('plugins.treesitter')
require('plugins.which_key')
require('plugins.fzf_lua')
require('plugins.oil_nvim')
require('plugins.lualine')
require('plugins.conform')
require('plugins.blink_cmp')
require('plugins.mini_nvim')
require('plugins.fidget')
require('plugins.gitsigns')
