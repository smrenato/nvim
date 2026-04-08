vim.pack.add({
    { src = 'https://github.com/nvim-mini/mini.ai' },
    { src = 'https://github.com/nvim-mini/mini.pairs' },
    { src = 'https://github.com/nvim-mini/mini.surround' },
    -- { src = 'https://github.com/nvim-mini/mini.cmdline' },
    -- { src = 'https://github.com/nvim-mini/mini.notify' },
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
