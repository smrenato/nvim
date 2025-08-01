-- Mini plugins that I find interesting

return {
    { 'echasnovski/mini.pairs',   version = false, opts = {} },
    { 'echasnovski/mini.animate', version = false, opts = {} },

    -- statusline
    {
        'echasnovski/mini.statusline',
        version = false,
        opts = {}
    },
    -- mini files
    {
        'echasnovski/mini.files',
        version = false,
        opts = {

            options = {
                -- Whether to delete permanently or move into module-specific trash
                permanent_delete = true,
                -- Whether to use for editing directories
                use_as_default_explorer = true,
            },
        },
    },
    {
        'echasnovski/mini.notify',
        version = false,
        opts = {

            lsp_progress = {
                -- Whether to enable showing
                enable = true,

                -- Notification level
                level = 'WARN',

                -- Duration (in ms) of how long last message should be shown
                duration_last = 1000,
            },
            window = {
                -- Floating window config
                config = {
                    border = 'rounded'


                },
            }
        }
    },
}
