-- apply options before load lazy
require('config.options')
require('config.autocmds')
require('config.keymaps')

-- load lazy
require('core.lazy')

-- load lsp
require('core.lsp')
-- helper for lsp
require('core.lsp_extras')
