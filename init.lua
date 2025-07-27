-- apply options before load lazy
require('config.options')
require('config.autocmds')
require('config.keymaps')

-- load lazy
require('config.lazy')

-- apply after lazy load

require('config.lsp')
