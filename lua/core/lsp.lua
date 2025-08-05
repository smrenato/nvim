-- Diagnostic Config
vim.diagnostic.config({
    severity_sort = true,
    float = { border = 'rounded', source = 'if_many' },
    underline = { severity = vim.diagnostic.severity.ERROR },
    signs = vim.g.have_nerd_font and {
        text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN] = '󰀪 ',
            [vim.diagnostic.severity.INFO] = '󰋽 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
        },
    } or {},
})

-- Better border on hover
local hover = vim.lsp.buf.hover
---@diagnostic disable-next-line: duplicate-set-field
vim.lsp.buf.hover = function()
    return hover({
        max_height = math.floor(vim.o.lines * 0.5),
        max_width = math.floor(vim.o.columns * 0.4),
    })
end

-- Better signature help
local signature_help = vim.lsp.buf.signature_help
---@diagnostic disable-next-line: duplicate-set-field
vim.lsp.buf.signature_help = function()
    return signature_help({
        max_height = math.floor(vim.o.lines * 0.5),
        max_width = math.floor(vim.o.columns * 0.4),
    })
end

-- Setup language servers.
-- Setup blink-cmp
local blink = function(capabilities)
    return require('blink.cmp').get_lsp_capabilities(capabilities)
end

vim.lsp.config('*', {
    capabilities = blink({
        textDocument = {
            foldingRange = {
                dynamicRegistration = false,
                lineFoldingOnly = true,
            },
        },
    }),
    root_markers = { '.git' },
})

-- Disable defaults
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        -- Unset 'formatexpr'
        vim.bo[args.buf].formatexpr = nil

        -- Unset 'omnifunc'
        vim.bo[args.buf].omnifunc = nil
        local function map(mode, keys, func, opts)
            vim.keymap.set(mode, keys, func, opts)
        end

        -- These GLOBAL keymaps are created unconditionally when Nvim starts:
        -- - "gO" is mapped in Normal mode to |vim.lsp.buf.document_symbol()|
        -- - CTRL-S is mapped in Insert mode to |vim.lsp.buf.signature_help()|

        map('n', 'grn', vim.lsp.buf.rename, { desc = 'lsp rename' })
        map(
            'n',
            'gO',
            vim.lsp.buf.document_symbol,
            { desc = 'lsp Document symbol' }
        )
        map('n', 'grD', vim.lsp.buf.declaration, { desc = 'lsp declaration' })
        map('n', 'grd', vim.lsp.buf.definition, { desc = 'lsp definition' })
        map(
            { 'n', 'v' },
            'gra',
            vim.lsp.buf.code_action,
            { desc = 'lsp code actions' }
        )
        map('n', 'grr', vim.lsp.buf.references, { desc = 'lsp references' })
        map(
            'n',
            'gri',
            vim.lsp.buf.implementation,
            { desc = 'lsp implementation' }
        )
        map(
            'n',
            'grt',
            vim.lsp.buf.type_definition,
            { desc = 'lsk type definitions' }
        )
    end,
})

-- Finally enable all lsp on nvim/lsp
vim.api.nvim_create_autocmd({ 'BufReadPre', 'BufNewFile' }, {
    once = true,
    callback = function()
        local server_configs = vim.iter(
            vim.api.nvim_get_runtime_file('lsp/*.lua', true)
        )
            :map(function(file)
                return vim.fn.fnamemodify(file, ':t:r')
            end)
            :totable()
        vim.lsp.enable(server_configs)
    end,
})
