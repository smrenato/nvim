-- Treesitter and textobjects

vim.pack.add({
    {
        src = gh('nvim-treesitter/nvim-treesitter'),
        -- name = 'treesitter',
        version = 'main',
    },
    {
        src = gh('nvim-treesitter/nvim-treesitter-textobjects'),
        -- name = 'textobjects',
        version = 'main',
    },
})

-- build = ':TSUpdate'
local hooks = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    -- Lua code), make sure to explicitly load it first
    if
        name == 'nvim-treesitter' and (kind == 'update' or kind == 'install')
    then
        vim.cmd('TSUpdate')
    end
end
vim.api.nvim_create_autocmd('PackChanged', { callback = hooks })

-- setup
local parsers = {
    'lua',
    'bash',
    'c',
    'diff',
    'html',
    'lua',
    'luadoc',
    'markdown',
    'markdown_inline',
    'query',
    'vim',
    'vimdoc',
    -- user
    'rust',
    'python',
    'toml',
}

-- Setup the treesitter
local treesitter = require('nvim-treesitter').setup({})

vim.api.nvim_create_autocmd('FileType', {
    pattern = parsers,
    callback = function(args)
        -- current language
        local ft = vim.bo[args.buf].filetype
        local lang = vim.treesitter.language.get_lang(ft)

        -- Check if there available languages

        if not vim.treesitter.language.add(lang) then
            local available = vim.g.ts_available
                or require('nvim-treesitter').get_available()
            if not vim.g.ts_available then
                vim.g.ts_available = available
            end
            if vim.tbl_contains(available, lang) then
                require('nvim-treesitter').install(lang)
            end
        end

        -- Set with current buf number
        if vim.treesitter.language.add(lang) then
            vim.treesitter.start(args.buf, lang)
            -- vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            -- vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
            -- vim.wo[0][0].foldmethod = "expr"
            vim.g.no_plugin_maps = true
        end
    end,
})

-- Configure textobjects
local textobjects = require('nvim-treesitter-textobjects').setup({
    move = {
        set_jumps = true,
    },
    select = {
        lookahead = true,
        selection_modes = {
            ['@parameter.outer'] = 'v', -- charwise
            ['@function.outer'] = 'V', -- linewise
            ['@class.outer'] = '<c-v>', -- blockwise
        },
        include_surrounding_whitespace = false,
    },
})

-- Surroundings
map({ 'x', 'o' }, 'am', function()
    require('nvim-treesitter-textobjects.select').select_textobject(
        '@function.outer',
        'textobjects'
    )
end, {})

map({ 'x', 'o' }, 'im', function()
    require('nvim-treesitter-textobjects.select').select_textobject(
        '@function.inner',
        'textobjects'
    )
end, {})

map({ 'x', 'o' }, 'ac', function()
    require('nvim-treesitter-textobjects.select').select_textobject(
        '@class.outer',
        'textobjects'
    )
end, {})
map({ 'x', 'o' }, 'ic', function()
    require('nvim-treesitter-textobjects.select').select_textobject(
        '@class.inner',
        'textobjects'
    )
end, {})

map({ 'x', 'o' }, 'as', function()
    require('nvim-treesitter-textobjects.select').select_textobject(
        '@local.scope',
        'locals'
    )
end, {})

-- Swaps
map('n', '<leader>a', function()
    require('nvim-treesitter-textobjects.swap').swap_next('@parameter.inner')
end, {})
map('n', '<leader>A', function()
    require('nvim-treesitter-textobjects.swap').swap_previous(
        '@parameter.outer'
    )
end, {})

-- Moves

-- functions
map({ 'n', 'x', 'o' }, ']m', function()
    require('nvim-treesitter-textobjects.move').goto_next_start(
        '@function.outer',
        'textobjects'
    )
end, {})

map({ 'n', 'x', 'o' }, ']]', function()
    require('nvim-treesitter-textobjects.move').goto_next_start(
        '@class.outer',
        'textobjects'
    )
end, {})

map({ 'n', 'x', 'o' }, ']o', function()
    move.goto_next_start({ '@loop.inner', '@loop.outer' }, 'textobjects')
end, {})

map({ 'n', 'x', 'o' }, ']s', function()
    require('nvim-treesitter-textobjects.move').goto_next_start(
        '@local.scope',
        'locals'
    )
end, {})

map({ 'n', 'x', 'o' }, ']z', function()
    require('nvim-treesitter-textobjects.move').goto_next_start(
        '@fold',
        'folds'
    )
end, {})

map({ 'n', 'x', 'o' }, ']M', function()
    require('nvim-treesitter-textobjects.move').goto_next_end(
        '@function.outer',
        'textobjects'
    )
end, {})
map({ 'n', 'x', 'o' }, '][', function()
    require('nvim-treesitter-textobjects.move').goto_next_end(
        '@class.outer',
        'textobjects'
    )
end, {})

map({ 'n', 'x', 'o' }, '[m', function()
    require('nvim-treesitter-textobjects.move').goto_previous_start(
        '@function.outer',
        'textobjects'
    )
end, {})
map({ 'n', 'x', 'o' }, '[[', function()
    require('nvim-treesitter-textobjects.move').goto_previous_start(
        '@class.outer',
        'textobjects'
    )
end, {})

map({ 'n', 'x', 'o' }, '[M', function()
    require('nvim-treesitter-textobjects.move').goto_previous_end(
        '@function.outer',
        'textobjects'
    )
end, {})

map({ 'n', 'x', 'o' }, '[]', function()
    require('nvim-treesitter-textobjects.move').goto_previous_end(
        '@class.outer',
        'textobjects'
    )
end, {})

-- Go to either the start or the end, whichever is closer.
map({ 'n', 'x', 'o' }, ']d', function()
    require('nvim-treesitter-textobjects.move').goto_next(
        '@conditional.outer',
        'textobjects'
    )
end, {})

map({ 'n', 'x', 'o' }, '[d', function()
    require('nvim-treesitter-textobjects.move').goto_previous(
        '@conditional.outer',
        'textobjects'
    )
end, {})

-- Repeatable moves
local ts_repeat_move = require('nvim-treesitter-textobjects.repeatable_move')

-- Repeat movement with ; and ,
-- ensure ; goes forward and , goes backward regardless of the last direction
map({ 'n', 'x', 'o' }, ';', ts_repeat_move.repeat_last_move_next)
map({ 'n', 'x', 'o' }, ',', ts_repeat_move.repeat_last_move_previous)

-- vim way: ; goes to the direction you were moving.
-- map({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
-- map({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

-- Optionally, make builtin f, F, t, T also repeatable with ; and ,
map({ 'n', 'x', 'o' }, 'f', ts_repeat_move.builtin_f_expr, { expr = true })
map({ 'n', 'x', 'o' }, 'F', ts_repeat_move.builtin_F_expr, { expr = true })
map({ 'n', 'x', 'o' }, 't', ts_repeat_move.builtin_t_expr, { expr = true })
map({ 'n', 'x', 'o' }, 'T', ts_repeat_move.builtin_T_expr, { expr = true })

-- This repeats the last query with always previous direction and to the start of the range.
map({ 'n', 'x', 'o' }, '<home>', function()
    ts_repeat_move.repeat_last_move({ forward = false, start = true })
end, {})

-- This repeats the last query with always next direction and to the end of the range.
map({ 'n', 'x', 'o' }, '<end>', function()
    ts_repeat_move.repeat_last_move({ forward = true, start = false })
end, {})

--
