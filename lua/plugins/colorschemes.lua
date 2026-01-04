-- Seutp kanagawa
vim.pack.add({
    {
        src = 'https://github.com/ibhagwan/fzf-lua',
        name = 'kanagawa',
        version = 'master',
    },
})
-- Plugin's code can be used directly after `add()`
local kanagawa = require('kanagawa').setup({
    vim.cmd('colorscheme kanagawa'),
})

local hooks = function(ev)
    -- Use available |event-data|
    local name, kind = ev.data.spec.name, ev.data.kind
    -- -- Run build script after plugin's code has changed
    -- if name == 'plug-1' and (kind == 'install' or kind == 'update') then
    --   vim.system({ 'make' }, { cwd = ev.data.path })
    -- end
    -- If action relies on code from the plugin (like user command or
    -- Lua code), make sure to explicitly load it first
    if name == 'kanagawa' and (kind == 'update' or kind == 'install') then
        -- if not ev.data.active then
        --   vim.cmd.packadd('plug-2')
        -- end
        if vim.cmd('KanagawaCompile').complete() then
            vim.cmd('colorscheme kanagawa')
            require('kanagawa').after_update()
        end
    end
end
-- If hooks need to run on install, run this before `vim.pack.add()`
vim.api.nvim_create_autocmd('PackChanged', { callback = hooks })
