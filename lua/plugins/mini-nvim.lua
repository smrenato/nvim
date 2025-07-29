-- Mini plugins that I find interesting

return {
  { 'echasnovski/mini.notify', version = false, opts = {} },
  { 'echasnovski/mini.pairs', version = false, opts = {} },
  { 'echasnovski/mini.statusline', version = false, opts = {} },
  { 'echasnovski/mini.animate', version = false, opts = {} },

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
}
