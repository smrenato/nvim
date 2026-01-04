-- notifications for lsp and other stuffs

vim.pack.add({
    { src = gh('j-hui/fidget.nvim') },
})

local fidget = require('fidget').setup({
    -- options
    notification = {
        override_vim_notify = true,
        window = {
            winblend = 90, -- Background color opacity in the notification window
            max_width = 40, -- Maximum width of the notification window
            -- max_height = 0, -- Maximum height of the notification window
        },
    },
})
