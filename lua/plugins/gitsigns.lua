local solid_bar = require('core.icons').misc.vertical_bar
local dashed_bar = require('core.icons').misc.dashed_bar

vim.pack.add({
    { src = gh('lewis6991/gitsigns.nvim') },
})

local gs = require('gitsigns').setup({
    signs = {
        add = { text = solid_bar },
        untracked = { text = solid_bar },
        change = { text = solid_bar },
        delete = { text = solid_bar },
        topdelete = { text = solid_bar },
        changedelete = { text = solid_bar },
    },
    signs_staged = {
        add = { text = dashed_bar },
        untracked = { text = dashed_bar },
        change = { text = dashed_bar },
        delete = { text = dashed_bar },
        topdelete = { text = dashed_bar },
        changedelete = { text = dashed_bar },
    },
    preview_config = { border = 'rounded' },
    current_line_blame = true,
    gh = true,
})

vim.api.nvim_create_autocmd({ 'BufReadPre', 'BufNewFile' }, {
    callback = function()
        local bufnr = vim.api.nvim_get_current_buf()
        local gs = package.loaded.gitsigns

        -- Register the leader group with miniclue.
        vim.b[bufnr].miniclue_config = {
            clues = {
                { mode = 'n', keys = '<leader>g', desc = '+git' },
                { mode = 'x', keys = '<leader>g', desc = '+git' },
            },
        }
        -- Mappings.
        ---@param lhs string
        ---@param rhs function
        ---@param desc string
        local function nmap(lhs, rhs, desc)
            vim.keymap.set('n', lhs, rhs, { desc = desc, buffer = bufnr })
        end
        nmap('[g', gs.prev_hunk, 'Previous hunk')
        nmap(']g', gs.next_hunk, 'Next hunk')
        nmap('<leader>gR', gs.reset_buffer, 'Reset buffer')
        nmap('<leader>gb', gs.blame_line, 'Blame line')
        nmap('<leader>gp', gs.preview_hunk, 'Preview hunk')
        nmap('<leader>gr', gs.reset_hunk, 'Reset hunk')
        nmap('<leader>gs', gs.stage_hunk, 'Stage hunk')
    end,
})
