vim.pack.add({
    { src = gh('nvim-mini/mini.ai') },
    { src = gh('nvim-mini/mini.pairs') },
    { src = gh('nvim-mini/mini.surround') },
    -- { src = gh('nvim-mini/mini.cmdline') },
    -- { src = gh('nvim-mini/mini.notify') },
})

local mini_pairs = require('mini.pairs').setup()
local mini_ai = require('mini.ai').setup()
local mini_surround = require('mini.surround').setup()
-- mini_cmdline = require('mini.cmdline').setup()

-- mini_cmdline = require('mini.notify').setup({
--     lsp_progress = {
--         enable = true,
--         level = 'WARN',
--
--         duration_last = 500,
--     },
-- })
