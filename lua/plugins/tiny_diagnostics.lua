-- Tiny and nicer inline diagnostics
vim.pack.add({
    {
        src = gh('rachartier/tiny-inline-diagnostic.nvim'),
        name = 'tiny-diagnostics',
    },
})

local tiny = require('tiny-inline-diagnostic').setup({
    diagnostics = { virtual_text = false },

    -- Choose a preset style for diagnostic appearance
    -- Available: "modern", "classic", "minimal", "powerline", "ghost", "simple", "nonerdfont", "amongus"
    preset = 'ghost',
    -- Make diagnostic background transparent
    transparent_bg = false,
})
