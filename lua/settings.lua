-- Quality of life settings
-- ++++++++++++++++++++++++++++++++++++++++++

local o, opt, wo, g = vim.o, vim.opt, vim.wo, vim.g

-- spelling checker
o.spell = true
opt.spelllang = { 'en', 'pt' }

-- Show white space.
opt.list = true
opt.listchars = { space = '⋅', trail = '⋅' }

-- Show line numbers.
wo.number = true
wo.relativenumber = true
o.mouse = 'a'
o.cursorline = true
o.mousescroll = 'ver:3,hor:0'

-- Wrap long lines at words.
o.linebreak = true

-- Folding.
o.foldcolumn = '1'
o.foldlevelstart = 99
wo.foldtext = ''
o.scrolloff = 10
o.sidescroll = 10

-- UI characters.
opt.fillchars = {
    eob = ' ',
    fold = ' ',
    -- foldclose = '⋅',
    -- foldopen = '⋅⋅',
    foldsep = ' ',
    foldinner = ' ',
    msgsep = '─',
}

o.winborder = 'rounded'
o.clipboard = 'unnamedplus'
o.undofile = true
o.exrc = true
o.ignorecase = true
o.smartcase = true
wo.signcolumn = 'yes'

-- Update times and timeouts.
o.updatetime = 300
o.timeoutlen = 500
o.ttimeoutlen = 10

-- Completion.
opt.wildignore:append { '.DS_Store' }
o.completeopt = 'menuone,noselect,noinsert'
o.pumheight = 15
o.pumborder = 'rounded'
opt.diffopt:append 'vertical,context:99'

opt.shortmess:append {
    w = true,
    s = true,
}

-- Status line.
o.laststatus = 3
o.cmdheight = 1

-- Disable cursor blinking in terminal mode.
o.guicursor = 'n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20,t:block-TermCursor'
g.loaded_python3_provider = 0
g.loaded_ruby_provider = 0
g.loaded_perl_provider = 0
g.loaded_node_provider = 0

-- Configure how new splits should be opened
o.splitright = true
o.splitbelow = true
o.confirm = true

-- Keymaps
-- ++++++++++++++++++++++++++++++++++++++++++

local map = vim.keymap.set

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
map('n', '<leader>r', '<cmd>restart<cr>', { desc = 'restart nvim' })

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
        'query',
        'vim',
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
