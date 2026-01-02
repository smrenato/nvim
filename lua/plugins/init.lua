-- routine update before packadd
-- require update plugins

gh = function(repo)
    return 'https://github.com/' .. repo
end

cb = function(repo)
    return 'https://codeberg.org/' .. repo
end

-- which pugins has to be activated
require('plugins.blink_cmp')
require('plugins.colorschemes')
require('plugins.fzf_lua')
require('plugins.conform')
require('plugins.lualine')
require('plugins.oil_nvim')
require('plugins.treesitter')
