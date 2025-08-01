return {
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        branch = 'main',
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
        },
        config = function()
            require("nvim-treesitter-textobjects").setup {
                move = {
                    -- whether to set jumps in the jumplist
                    set_jumps = true,
                },

                select = {
                    -- Automatically jump forward to textobj, similar to targets.vim
                    lookahead = true,
                    -- mapping query_strings to modes.
                    selection_modes = {
                        ['@parameter.outer'] = 'v', -- charwise
                        ['@function.outer'] = 'V',  -- linewise
                        ['@class.outer'] = '<c-v>', -- blockwise
                    },
                    -- and should return true of false
                    include_surrounding_whitespace = false,
                },

            }
        end,
        keys = {
            {
                "af",
                function()
                    require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
                end,
                desc = "Select outer function",
                mode = { "x", "o" },
            },
            {
                "if",
                function()
                    require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
                end,
                desc = "Select inner function",
                mode = { "x", "o" },
            },
            {
                "ac",
                function()
                    require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
                end,
                desc = "Select outer class",
                mode = { "x", "o" },
            },
            {
                "ic",
                function()
                    require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
                end,
                desc = "Select inner class",
                mode = { "x", "o" },
            },
            {
                "as",
                function()
                    require("nvim-treesitter-textobjects.select").select_textobject("@local.scope", "locals")
                end,
                desc = "Select local scope",
                mode = { "x", "o" },
            },
        },
        ---@module "nvim-treesitter-textobjects"
        opts = { multiwindow = true },
    },

    { -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        build = ':TSUpdate',
        branch = 'main',
        -- [[ Configure Treesitter ]] See `:help nvim-treesitter-intro`
        config = function()
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
                'toml'
            }
            require('nvim-treesitter').install(parsers)

            vim.api.nvim_create_autocmd('FileType', {
                pattern = parsers,
                callback = function()
                    -- enbales syntax highlighting and other treesitter features
                    vim.treesitter.start()

                    -- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

                    -- enables treesitter based indentation
                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end,
            })
        end,
    },
}
