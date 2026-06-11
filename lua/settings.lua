-- Quality of life settings
-- ++++++++++++++++++++++++++++++++++++++++++

vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.showmode = false

vim.o.scrolloff = 10
vim.o.sidescroll = 10

-- spelling checker
vim.o.spell = true
vim.opt.spelllang = { 'en', 'pt' }

-- Show white space.
vim.opt.list = true
vim.opt.listchars = { space = '⋅', trail = '⋅' }

-- Show line numbers.
vim.wo.number = true
vim.wo.relativenumber = true
vim.o.mouse = 'a'
vim.o.cursorline = true
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

vim.o.winborder = 'rounded'
vim.o.clipboard = 'unnamedplus'
vim.o.undofile = true
vim.o.exrc = true
vim.o.ignorecase = true
vim.o.smartcase = true
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
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.confirm = true

-- Keymaps
-- ++++++++++++++++++++++++++++++++++++++++++

local map = vim.keymap.set

-- Oil
map('n', '<leader>e', '<CMD>Oil<CR>', { desc = 'open parent directory' })

-- Lsp
map({ 'n' }, 'gd', vim.lsp.buf.declaration, { desc = 'lsp go to declaration' })
map({ 'n' }, 'gD', vim.lsp.buf.definition, { desc = 'lsp go to definition' })
map({ 'n' }, 'ga', vim.lsp.buf.code_action, { desc = 'lsp code action' })

-- Move to end and start of line
map({ 'n', 'v', 'x', 'o' }, 'gh', '^', { desc = 'Go to first characters of line' })
map({ 'n', 'v', 'x', 'o' }, 'gl', '$', { desc = 'Go to end of line' })

-- trim? 'ctrl-_' to yank and trim a line, copied from helix
map({ 'n', 'o' }, '<c-_>', '<CMD>normal! ^vg_y<CR>', { noremap = true, silent = true })

-- Remap for dealing with word wrap and adding jumps to the jumplist.
map('n', 'j', [[(v:count > 1 ? 'm`' . v:count : 'g') . 'j']], { expr = true })
map('n', 'k', [[(v:count > 1 ? 'm`' . v:count : 'g') . 'k']], { expr = true })

-- Keeping the cursor centered.
map('n', '<C-d>', '<C-d>zz', { desc = 'Scroll downwards' })
map('n', '<C-u>', '<C-u>zz', { desc = 'Scroll upwards' })
map('n', 'n', 'nzzzv', { desc = 'Next result' })
map('n', 'N', 'Nzzzv', { desc = 'Previous result' })

-- Indent while remaining in visual mode.
map('v', '<', '<gv')
map('v', '>', '>gv')

-- Formatting.
map('n', 'gQ', 'mzgggqG`z<cmd>delmarks z<cr>zz', { desc = 'Format buffer' })

-- Restart Neovim.
map('n', '<leader>R', '<cmd>restart<cr>', { desc = 'restart nvim' })

-- Switch between windows.
map('n', '<C-h>', '<C-w>h', { desc = 'Move to the left window', remap = true })
map('n', '<C-j>', '<C-w>j', { desc = 'Move to the bottom window', remap = true })
map('n', '<C-k>', '<C-w>k', { desc = 'Move to the top window', remap = true })
map('n', '<C-l>', '<C-w>l', { desc = 'Move to the right window', remap = true })

-- Tab navigation.
map('n', '<leader>tc', '<cmd>tabclose<cr>', { desc = 'Close tab page' })
map('n', '<leader>tn', '<cmd>tab split<cr>', { desc = 'New tab page' })
map('n', '<leader>to', '<cmd>tabonly<cr>', { desc = 'Close other tab pages' })

-- Powerful <esc>.
map({ 'i', 's', 'n' }, '<esc>', function()
    -- if require('luasnip').expand_or_jumpable() then
    --     require('luasnip').unlink_current()
    -- end
    vim.cmd 'noh'
    return '<esc>'
end, { desc = 'Escape, clear hlsearch, and stop snippet session', expr = true })

-- Make U opposite to u.
map('n', 'U', '<CMD>redo<CR>', { desc = 'Redo' })
map({ 'n', 'v' }, '<c-r>', function() end, { desc = 'do nothing' })

-- Escape and save changes.
map({ 's', 'i', 'n', 'v' }, '<C-s>', '<esc>:w<cr>', { desc = 'Exit insert mode and save changes' })
map({ 's', 'i', 'n', 'v' }, '<C-S-s>', function()
    vim.g.skip_formatting = true
    return '<esc>:w<cr>'
end, { desc = 'Exit insert mode and save changes (without formatting)', expr = true })

-- Quickly go to the end of the line while in insert mode.
map({ 'i', 'c' }, '<C-l>', '<C-o>A', { desc = 'Go to the end of the line' })

-- Mark management.
map('c', 'dm', 'delmarks', { desc = 'Delete marks' })

-- Resize window using <ctrl> arrow keys
map('n', '<C-Up>', '<cmd>resize +2<cr>', { desc = 'Increase Window Height' })
map('n', '<C-Down>', '<cmd>resize -2<cr>', { desc = 'Decrease Window Height' })
map('n', '<C-Left>', '<cmd>vertical resize -2<cr>', { desc = 'Decrease Window Width' })
map('n', '<C-Right>', '<cmd>vertical resize +2<cr>', { desc = 'Increase Window Width' })

-- Nice auto commands to have
-- ++++++++++++++++++++++++++++++++++++++++++++++
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

autocmd('FileType', {
    group = augroup('smrenato/close_with_q', { clear = true }),
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
            map('n', 'q', '<cmd>quit<cr>', { buffer = args.buf })
        end
    end,
})

autocmd('FileType', {
    group = augroup('smrenato/disable_help_conceal', { clear = true }),
    desc = 'Disable conceal in modifiable help files',
    pattern = 'help',
    callback = function(args)
        if vim.bo[args.buf].modifiable then
            vim.wo.conceallevel = 0
        end
    end,
})

autocmd('VimEnter', {
    group = augroup('smrenato/dotfiles_setup', { clear = true }),
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

autocmd('CmdwinEnter', {
    group = augroup('smrenato/execute_cmd_and_stay', { clear = true }),
    desc = 'Execute command and stay in the command-line window',
    callback = function(args)
        map({ 'n', 'i' }, '<S-CR>', '<cr>q:', { buffer = args.buf })
    end,
})

autocmd('BufReadPost', {
    group = augroup('smrenato/last_location', { clear = true }),
    desc = 'Go to the last location when opening a buffer',
    callback = function(args)
        local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
        local line_count = vim.api.nvim_buf_line_count(args.buf)
        if mark[1] > 0 and mark[1] <= line_count then
            vim.cmd 'normal! g`"zz'
        end
    end,
})

autocmd('FileType', {
    group = augroup('smrenato/treesitter_folding', { clear = true }),
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

autocmd('TextYankPost', {
    group = augroup('smrenato/yank_highlight', { clear = true }),
    desc = 'Highlight on yank',
    callback = function()
        vim.hl.on_yank { higroup = 'Visual' }
    end,
})

-- resize splits if window got resized
autocmd({ 'VimResized' }, {
    group = augroup('smrenato/resize_splits', { clear = true }),
    callback = function()
        local current_tab = vim.fn.tabpagenr()
        vim.cmd 'tabdo wincmd ='
        vim.cmd('tabnext ' .. current_tab)
    end,
})

-- Check if we need to reload the file when it changed
autocmd({ 'FocusGained', 'TermClose', 'TermLeave' }, {
    group = augroup('smrenato/checktime_when_focus', { clear = true }),
    callback = function()
        if vim.o.buftype ~= 'nofile' then
            vim.cmd 'checktime'
        end
    end,
})

-- make it easier to close man-files when opened inline
autocmd('FileType', {
    group = augroup('smrenato/easy_man_close', { clear = true }),
    pattern = { 'man' },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
    end,
})

-- wrap and check for spell in text filetypes
autocmd('FileType', {
    group = augroup('smrenato/spell_per_ft', { clear = true }),
    pattern = { 'text', 'plaintex', 'typst', 'gitcommit', 'markdown' },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = true
    end,
})
