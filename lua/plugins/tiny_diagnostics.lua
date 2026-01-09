-- Tiny and nicer inline diagnostics
vim.pack.add({
    {
        src = gh('rachartier/tiny-inline-diagnostic.nvim'),
        name = 'tiny-diagnostics',
    },
})

local tiny = require('tiny-inline-diagnostic').setup({
    diagnostics = { virtual_text = false },
})
