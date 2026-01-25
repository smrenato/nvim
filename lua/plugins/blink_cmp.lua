vim.pack.add({
    {
        src = gh('Saghen/blink.cmp'),
        version = vim.version.range('1.*'),
    },
})
-- Plugin's code can be used directly after `add()`
local blink = require('blink.cmp').setup({
    keymap = { preset = 'default' },

    appearance = {
        nerd_font_variant = 'mono',
    },

    completion = { documentation = { auto_show = false } },

    sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
    },

    fuzzy = { implementation = 'prefer_rust_with_warning' },

    -- Experimental signature help support
    signature = { enabled = true },
})
