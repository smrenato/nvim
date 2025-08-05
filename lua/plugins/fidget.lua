-- better notifications

return {
    'j-hui/fidget.nvim',
    opts = {
        -- options
        notification = {
            window = {
                winblend = 90, -- Background color opacity in the notification window
                max_width = 40, -- Maximum width of the notification window
                -- max_height = 0, -- Maximum height of the notification window
            },
        },
    },
}
