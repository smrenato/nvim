-- Treesitter and Textobjects
vim.pack.add {
    {
        src = 'https://github.com/nvim-treesitter/nvim-treesitter',
        version = 'main',
    },
    {
        src = 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects',
        version = 'main',
    },
}

vim.api.nvim_create_autocmd('PackChanged', {
    callback = function(ev)
        local name, kind = ev.data.spec.name, ev.data.kind
        if name == 'nvim-treesitter' and (kind == 'update' or kind == 'install') then
            vim.cmd 'TSUpdate'
        end
    end,
})

-- Setup the treesitter
local treesitter = require('nvim-treesitter').setup {}

-- Parsers
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
    'yaml',
    'json',
    'jsdoc',
}

-- Auto install parsers
vim.api.nvim_create_autocmd('FileType', {
    pattern = parsers,
    callback = function(args)
        -- current language
        local ft = vim.bo[args.buf].filetype
        local lang = vim.treesitter.language.get_lang(ft)

        -- Check if there available languages
        ---@diagnostic disable-line: assign-type-mismatch
        ---@diagnostic disable-next-line: param-type-mismatch
        if not vim.treesitter.language.add(lang) then
            local available = vim.g.ts_available or require('nvim-treesitter').get_available()
            if not vim.g.ts_available then
                vim.g.ts_available = available
            end
            if vim.tbl_contains(available, lang) then
                require('nvim-treesitter').install(lang)
            end
        end

        -- Set with current buf number
        ---@diagnostic disable-next-line: param-type-mismatch
        if vim.treesitter.language.add(lang) then
            vim.treesitter.start(args.buf, lang)
            vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            -- vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
            -- vim.wo[0][0].foldmethod = "expr"
            vim.g.no_plugin_maps = true
        end
    end,
})

-- Define textobjects
local textobjects = require('nvim-treesitter-textobjects').setup {
    move = {
        set_jumps = true,
    },
    select = {
        lookahead = true,
        selection_modes = {
            ['@parameter.outer'] = 'v',
            ['@function.outer'] = 'V',
            ['@class.outer'] = '<c-v>',
        },
        include_surrounding_whitespace = false,
    },
}

-- Helper
local map = vim.keymap.set

-- Surroundings
map({ 'x', 'o' }, 'af', function()
    require('nvim-treesitter-textobjects.select').select_textobject('@function.outer', 'textobjects')
end, { desc = 'around function' })
map({ 'x', 'o' }, 'if', function()
    require('nvim-treesitter-textobjects.select').select_textobject('@function.inner', 'textobjects')
end, { desc = 'inside function' })

map({ 'x', 'o' }, 'ac', function()
    require('nvim-treesitter-textobjects.select').select_textobject('@class.outer', 'textobjects')
end, { desc = 'around class' })
map({ 'x', 'o' }, 'ic', function()
    require('nvim-treesitter-textobjects.select').select_textobject('@class.inner', 'textobjects')
end, { desc = 'inside class' })

map({ 'x', 'o' }, 'as', function()
    require('nvim-treesitter-textobjects.select').select_textobject('@local.scope', 'locals')
end, { desc = 'around scope' })

-- Swaps
map('n', '<leader>ca', function()
    require('nvim-treesitter-textobjects.swap').swap_next '@parameter.inner'
end, { desc = 'parameter swap inner' })
map('n', '<leader>cA', function()
    require('nvim-treesitter-textobjects.swap').swap_previous '@parameter.outer'
end, { desc = 'parameter swap outer' })

-- Moves
map({ 'n', 'x', 'o' }, ']f', function()
    require('nvim-treesitter-textobjects.move').goto_next_start('@function.outer', 'textobjects')
end, { desc = 'next function' })

map({ 'n', 'x', 'o' }, ']]', function()
    require('nvim-treesitter-textobjects.move').goto_next_start('@class.outer', 'textobjects')
end, { desc = 'next class' })

map({ 'n', 'x', 'o' }, ']o', function()
    require('nvim-treesitter-textobjects.move').goto_next_start({ '@loop.inner', '@loop.outer' }, 'textobjects')
end, { desc = 'next loop' })

map({ 'n', 'x', 'o' }, ']s', function()
    require('nvim-treesitter-textobjects.move').goto_next_start('@local.scope', 'locals')
end, { desc = 'next scope' })

map({ 'n', 'x', 'o' }, ']z', function()
    require('nvim-treesitter-textobjects.move').goto_next_start('@fold', 'folds')
end, { desc = 'next fold' })

map({ 'n', 'x', 'o' }, ']F', function()
    require('nvim-treesitter-textobjects.move').goto_next_end('@function.outer', 'textobjects')
end, { desc = 'next function end' })

map({ 'n', 'x', 'o' }, '][', function()
    require('nvim-treesitter-textobjects.move').goto_next_end('@class.outer', 'textobjects')
end, { desc = 'next class end' })

map({ 'n', 'x', 'o' }, '[f', function()
    require('nvim-treesitter-textobjects.move').goto_previous_start('@function.outer', 'textobjects')
end, { desc = 'prev function' })

map({ 'n', 'x', 'o' }, '[[', function()
    require('nvim-treesitter-textobjects.move').goto_previous_start('@class.outer', 'textobjects')
end, { desc = 'prev class' })

map({ 'n', 'x', 'o' }, '[F', function()
    require('nvim-treesitter-textobjects.move').goto_previous_end('@function.outer', 'textobjects')
end, { desc = 'prev function end' })

map({ 'n', 'x', 'o' }, '[]', function()
    require('nvim-treesitter-textobjects.move').goto_previous_end('@class.outer', 'textobjects')
end, { desc = 'prev class end' })

map({ 'n', 'x', 'o' }, ']d', function()
    require('nvim-treesitter-textobjects.move').goto_next('@conditional.outer', 'textobjects')
end, { desc = 'next conditional' })

map({ 'n', 'x', 'o' }, '[d', function()
    require('nvim-treesitter-textobjects.move').goto_previous('@conditional.outer', 'textobjects')
end, { desc = 'prev conditional' })

-- Repeatable moves
local ts_repeat_move = require 'nvim-treesitter-textobjects.repeatable_move'

map({ 'n', 'x', 'o' }, ';', ts_repeat_move.repeat_last_move_next)
map({ 'n', 'x', 'o' }, ',', ts_repeat_move.repeat_last_move_previous)

map({ 'n', 'x', 'o' }, 'f', ts_repeat_move.builtin_f_expr, { expr = true })
map({ 'n', 'x', 'o' }, 'F', ts_repeat_move.builtin_F_expr, { expr = true })
map({ 'n', 'x', 'o' }, 't', ts_repeat_move.builtin_t_expr, { expr = true })
map({ 'n', 'x', 'o' }, 'T', ts_repeat_move.builtin_T_expr, { expr = true })

map({ 'n', 'x', 'o' }, '<A-.>', function()
    ts_repeat_move.repeat_last_move()
end, { desc = 'repeat last move' })
