vim.pack.add({
    {
        src = 'https://github.com/Saghen/blink.cmp',
        version = '1.*',
    },
})
-- Plugin's code can be used directly after `add()`
blink = require('blink.cmp').setup({
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
