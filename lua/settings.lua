-- Quality of life settings
-- ++++++++++++++++++++++++++++++++++++++++++
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4

-- spelling checker
vim.o.spell = true
vim.opt.spelllang = { 'en' }

-- Show white space.
vim.opt.list = true
vim.opt.listchars = { space = '⋅', trail = '⋅' }

-- Show line numbers.
vim.wo.number = true
vim.wo.relativenumber = true

-- Enable mouse mode.
vim.o.mouse = 'a'

-- Show line under cursor
vim.o.cursorline = true

-- Disable horizontal scrolling.
vim.o.mousescroll = 'ver:3,hor:0'

-- Wrap long lines at words.
vim.o.linebreak = true

-- Folding.
vim.o.foldcolumn = '1'
vim.o.foldlevelstart = 99
vim.wo.foldtext = ''

-- UI characters.
vim.opt.fillchars = {
    eob = ' ',
    fold = ' ',
    -- foldclose = '⋅',
    -- foldopen = '⋅⋅',
    foldsep = ' ',
    foldinner = ' ',
    msgsep = '─',
}

-- Use rounded borders for floating windows.
vim.o.winborder = 'rounded'

-- Sync clipboard between the OS and Neovim.
vim.o.clipboard = 'unnamedplus'

-- Save undo history.
vim.o.undofile = true

-- Enable project-local configuration.
vim.o.exrc = true

-- Case insensitive searching UNLESS /C or the search has capitals.
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default.
vim.wo.signcolumn = 'yes'

-- Update times and timeouts.
vim.o.updatetime = 300
vim.o.timeoutlen = 500
vim.o.ttimeoutlen = 10

-- Completion.
vim.opt.wildignore:append { '.DS_Store' }
vim.o.completeopt = 'menuone,noselect,noinsert'
vim.o.pumheight = 15
vim.o.pumborder = 'rounded'

-- Diff mode settings.
-- Setting the context to a very large number disables folding.
vim.opt.diffopt:append 'vertical,context:99'

vim.opt.shortmess:append {
    w = true,
    s = true,
}

-- Status line.
vim.o.laststatus = 3
vim.o.cmdheight = 1

-- Disable cursor blinking in terminal mode.
vim.o.guicursor = 'n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20,t:block-TermCursor'

-- Disable health checks for these providers.
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Buffer confirm
vim.o.confirm = true

-- Keymaps
-- ++++++++++++++++++++++++++++++++++++++++++

-- Oil
vim.keymap.set('n', '<leader>e', '<CMD>Oil<CR>', { desc = 'open parent directory' })

-- Lsp
vim.keymap.set({ 'n' }, 'gd', vim.lsp.buf.declaration, { desc = 'lsp go to declaration' })
vim.keymap.set({ 'n' }, 'gD', vim.lsp.buf.definition, { desc = 'lsp go to definition' })
vim.keymap.set({ 'n' }, 'ga', vim.lsp.buf.code_action, { desc = 'lsp code action' })

-- Move to end and start of line
vim.keymap.set({ 'n', 'v', 'x', 'o' }, 'gh', '^', { desc = 'Go to first characters of line' })
vim.keymap.set({ 'n', 'v', 'x', 'o' }, 'gl', '$', { desc = 'Go to end of line' })

-- trim?
vim.keymap.set({ 'n', 'o' }, '<C-_>', function()
    vim.cmd 'normal! ^vg_y'
end, { noremap = true, silent = true })

-- Remap for dealing with word wrap and adding jumps to the jumplist.
vim.keymap.set('n', 'j', [[(v:count > 1 ? 'm`' . v:count : 'g') . 'j']], { expr = true })
vim.keymap.set('n', 'k', [[(v:count > 1 ? 'm`' . v:count : 'g') . 'k']], { expr = true })

-- Keeping the cursor centered.
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll downwards' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll upwards' })
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Next result' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Previous result' })

-- Indent while remaining in visual mode.
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Formatting.
vim.keymap.set('n', 'gQ', 'mzgggqG`z<cmd>delmarks z<cr>zz', { desc = 'Format buffer' })

-- Restart Neovim.
vim.keymap.set('n', '<leader>R', '<cmd>restart<cr>', { desc = 'restart nvim' })

-- Switch between windows.
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move to the left window', remap = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move to the bottom window', remap = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move to the top window', remap = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move to the right window', remap = true })

-- Tab navigation.
vim.keymap.set('n', '<leader>tc', '<cmd>tabclose<cr>', { desc = 'Close tab page' })
vim.keymap.set('n', '<leader>tn', '<cmd>tab split<cr>', { desc = 'New tab page' })
vim.keymap.set('n', '<leader>to', '<cmd>tabonly<cr>', { desc = 'Close other tab pages' })

-- Poweful <esc>.
vim.keymap.set({ 'i', 's', 'n' }, '<esc>', function()
    -- if require('luasnip').expand_or_jumpable() then
    --     require('luasnip').unlink_current()
    -- end
    vim.cmd 'noh'
    return '<esc>'
end, { desc = 'Escape, clear hlsearch, and stop snippet session', expr = true })

-- Make U opposite to u.
vim.keymap.set('n', 'U', '<C-r>', { desc = 'Redo' })

-- Escape and save changes.
vim.keymap.set({ 's', 'i', 'n', 'v' }, '<C-s>', '<esc>:w<cr>', { desc = 'Exit insert mode and save changes' })
vim.keymap.set({ 's', 'i', 'n', 'v' }, '<C-S-s>', function()
    vim.g.skip_formatting = true
    return '<esc>:w<cr>'
end, { desc = 'Exit insert mode and save changes (without formatting)', expr = true })

-- Quickly go to the end of the line while in insert mode.
vim.keymap.set({ 'i', 'c' }, '<C-l>', '<C-o>A', { desc = 'Go to the end of the line' })

-- Mark management.
vim.keymap.set('c', 'dm', 'delmarks', { desc = 'Delete marks' })

-- Resize window using <ctrl> arrow keys
vim.keymap.set('n', '<C-Up>', '<cmd>resize +2<cr>', { desc = 'Increase Window Height' })
vim.keymap.set('n', '<C-Down>', '<cmd>resize -2<cr>', { desc = 'Decrease Window Height' })
vim.keymap.set('n', '<C-Left>', '<cmd>vertical resize -2<cr>', { desc = 'Decrease Window Width' })
vim.keymap.set('n', '<C-Right>', '<cmd>vertical resize +2<cr>', { desc = 'Increase Window Width' })

-- Nice auto commands to have
-- ++++++++++++++++++++++++++++++++++++++++++++++

vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('smrenato/close_with_q', { clear = true }),
    desc = 'Close with <q>',
    pattern = {
        'git',
        'help',
        'man',
        'qf',
        'scratch',
        'oil',
        'qf',
    },

    callback = function(args)
        if args.match ~= 'help' or not vim.bo[args.buf].modifiable then
            vim.keymap.set('n', 'q', '<cmd>quit<cr>', { buffer = args.buf })
        end
    end,
})

vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('smrenato/disable_help_conceal', { clear = true }),
    desc = 'Disable conceal in modifiable help files',
    pattern = 'help',
    callback = function(args)
        if vim.bo[args.buf].modifiable then
            vim.wo.conceallevel = 0
        end
    end,
})

vim.api.nvim_create_autocmd('VimEnter', {
    group = vim.api.nvim_create_augroup('smrenato/dotfiles_setup', { clear = true }),
    desc = 'Special dotfiles setup',
    callback = function()
        local ok, inside_dotfiles = pcall(vim.startswith, vim.fn.getcwd(), vim.env.XDG_CONFIG_HOME)
        if not ok or not inside_dotfiles then
            return
        end

        -- Configure git environment.
        vim.env.GIT_WORK_TREE = vim.env.HOME
        vim.env.GIT_DIR = vim.env.HOME .. '/.cfg'
    end,
})

vim.api.nvim_create_autocmd('CmdwinEnter', {
    group = vim.api.nvim_create_augroup('smrenato/execute_cmd_and_stay', { clear = true }),
    desc = 'Execute command and stay in the command-line window',
    callback = function(args)
        vim.keymap.set({ 'n', 'i' }, '<S-CR>', '<cr>q:', { buffer = args.buf })
    end,
})

vim.api.nvim_create_autocmd('BufReadPost', {
    group = vim.api.nvim_create_augroup('smrenato/last_location', { clear = true }),
    desc = 'Go to the last location when opening a buffer',
    callback = function(args)
        local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
        local line_count = vim.api.nvim_buf_line_count(args.buf)
        if mark[1] > 0 and mark[1] <= line_count then
            vim.cmd 'normal! g`"zz'
        end
    end,
})

vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('smrenato/treesitter_folding', { clear = true }),
    desc = 'Enable Treesitter folding',
    callback = function(args)
        local bufnr = args.buf

        -- Enable Treesitter folding when not in huge files and when Treesitter
        -- is working.
        if vim.bo[bufnr].filetype ~= 'bigfile' and pcall(vim.treesitter.start, bufnr) then
            vim.api.nvim_buf_call(bufnr, function()
                vim.wo[0][0].foldmethod = 'expr'
                vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
                vim.cmd.normal 'zx'
            end)
        end
    end,
})

vim.api.nvim_create_autocmd('TextYankPost', {
    group = vim.api.nvim_create_augroup('smrenato/yank_highlight', { clear = true }),
    desc = 'Highlight on yank',
    callback = function()
        vim.hl.on_yank { higroup = 'Visual' }
    end,
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ 'VimResized' }, {
    group = vim.api.nvim_create_augroup('smrenato/resize_splits', { clear = true }),
    callback = function()
        local current_tab = vim.fn.tabpagenr()
        vim.cmd 'tabdo wincmd ='
        vim.cmd('tabnext ' .. current_tab)
    end,
})

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ 'FocusGained', 'TermClose', 'TermLeave' }, {
    group = vim.api.nvim_create_augroup('smrenato/checktime_when_focus', { clear = true }),
    callback = function()
        if vim.o.buftype ~= 'nofile' then
            vim.cmd 'checktime'
        end
    end,
})

-- make it easier to close man-files when opened inline
vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('smrenato/easy_man_close', { clear = true }),
    pattern = { 'man' },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
    end,
})

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('smrenato/spell_per_ft', { clear = true }),
    pattern = { 'text', 'plaintex', 'typst', 'gitcommit', 'markdown' },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = true
    end,
})
