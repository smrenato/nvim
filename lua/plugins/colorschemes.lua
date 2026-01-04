-- Seutp kanagawa
vim.pack.add({
    {
        src = gh('rebelot/kanagawa.nvim'),
        version = 'master',
    },
})
-- Plugin's code can be used directly after `add()`
local kanagawa = require('kanagawa').setup({})

local hooks = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'kanagawa' and (kind == 'update' or kind == 'install') then
        vim.cmd('KanagawaCompile')
        vim.cmd('colorscheme kanagawa')
    end
end
-- If hooks need to run on install, run this before `vim.pack.add()`
vim.api.nvim_create_autocmd('PackChanged', { callback = hooks })

-- set theme
vim.cmd('colorscheme kanagawa')
