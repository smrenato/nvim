local wk = require('which-key')

local M = {}

-- Disable inlay hints initially (and enable if needed with my ToggleInlayHints command).
vim.g.inlay_hints = false

--- Sets up LSP keymaps and autocommands for the given buffer.
local function on_attach(client, bufnr)
    wk.add({
        mode = 'n',
        {
            '[d',
            function()
                vim.diagnostic.jump({ count = -1 })
            end,
            desc = 'previous diagnostic',
        },
        {
            ']d',
            function()
                vim.diagnostic.jump({ count = 1 })
            end,
            desc = 'next diagnostic',
        },
        {
            '[e',
            function()
                vim.diagnostic.jump({
                    count = -1,
                    severity = vim.diagnostic.severity.ERROR,
                })
            end,
            desc = 'previous error',
        },
        {
            ']e',
            function()
                vim.diagnostic.jump({
                    count = 1,
                    severity = vim.diagnostic.severity.ERROR,
                })
            end,
            desc = 'next error',
        },
    })

    -- Don't check for the capability here to allow dynamic registration of the request.
    vim.lsp.document_color.enable(true, bufnr)

    if client:supports_method('textDocument/documentColor') then
        wk.add({
            mode = { 'n', 'x' },
            'grc',
            function()
                vim.lsp.document_color.color_presentation()
            end,
            desc = 'lsp color presentation',
        })
    end

    if client:supports_method('textDocument/references') then
        wk.add({
            mode = 'n',
            'grr',
            '<cmd>FzfLua lsp_references<cr>',
            desc = 'fzf find references',
        })
    end

    if client:supports_method('textDocument/typeDefinition') then
        wk.add({
            mode = 'n',
            'gy',
            '<cmd>FzfLua lsp_typedefs<cr>',
            desc = 'Go to type definition',
        })
    end

    if client:supports_method('textDocument/documentSymbol') then
        wk.add({
            mode = 'n',
            '<leader>fs',
            '<cmd>FzfLua lsp_document_symbols<cr>',
            desc = 'Document symbols',
        })
    end

    if client:supports_method('textDocument/definition') then
        wk.add({
            mode = 'n',
            'gd',
            function()
                require('fzf-lua').lsp_definitions({ jump1 = true })
            end,
            desc = 'Go to definition',
        })

        wk.add({
            mode = 'n',
            'gD',
            function()
                require('fzf-lua').lsp_definitions({ jump1 = false })
            end,
            desc = 'Peek definition',
        })
    end

    if client:supports_method('textDocument/signatureHelp') then
        wk.add({
            mode = 'i',
            '<C-k>',
            function()
                -- Close the completion menu first (if open).
                if
                    require('blink.cmp.completion.windows.menu').win:is_open()
                then
                    require('blink.cmp').hide()
                end

                vim.lsp.buf.signature_help()
            end,
            desc = 'Signature help',
        })
    end

    if client:supports_method('textDocument/inlayHint') then
        local inlay_hints_group = vim.api.nvim_create_augroup(
            'mariasolos/toggle_inlay_hints',
            { clear = false }
        )

        if vim.g.inlay_hints then
            -- Initial inlay hint display.
            vim.defer_fn(function()
                local mode = vim.api.nvim_get_mode().mode
                vim.lsp.inlay_hint.enable(
                    mode == 'n' or mode == 'v',
                    { bufnr = bufnr }
                )
            end, 500)
        end

        vim.api.nvim_create_autocmd('InsertEnter', {
            group = inlay_hints_group,
            desc = 'Enable inlay hints',
            buffer = bufnr,
            callback = function()
                if vim.g.inlay_hints then
                    vim.lsp.inlay_hint.enable(false, { bufnr = bufnr })
                end
            end,
        })

        vim.api.nvim_create_autocmd('InsertLeave', {
            group = inlay_hints_group,
            desc = 'Disable inlay hints',
            buffer = bufnr,
            callback = function()
                if vim.g.inlay_hints then
                    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
                end
            end,
        })
    end
end

-- Diagnostic configuration.
vim.diagnostic.config({
    virtual_text = false,
    -- Disable signs in the gutter.
    signs = false,
})

-- Override the virtual text diagnostic handler so that the most severe diagnostic is shown first.
local show_handler = assert(vim.diagnostic.handlers.virtual_text.show)
local hide_handler = vim.diagnostic.handlers.virtual_text.hide
vim.diagnostic.handlers.virtual_text = {
    show = function(ns, bufnr, diagnostics, opts)
        table.sort(diagnostics, function(diag1, diag2)
            return diag1.severity > diag2.severity
        end)
        return show_handler(ns, bufnr, diagnostics, opts)
    end,
    hide = hide_handler,
}

-- Override the hover
local hover = vim.lsp.buf.hover
---@diagnostic disable-next-line: duplicate-set-field
vim.lsp.buf.hover = function()
    return hover({
        max_height = math.floor(vim.o.lines * 0.5),
        max_width = math.floor(vim.o.columns * 0.4),
    })
end

local signature_help = vim.lsp.buf.signature_help
---@diagnostic disable-next-line: duplicate-set-field
vim.lsp.buf.signature_help = function()
    return signature_help({
        max_height = math.floor(vim.o.lines * 0.5),
        max_width = math.floor(vim.o.columns * 0.4),
    })
end

-- Update mappings when registering dynamic capabilities.
local register_capability = vim.lsp.handlers['client/registerCapability']
vim.lsp.handlers['client/registerCapability'] = function(err, res, ctx)
    local client = vim.lsp.get_client_by_id(ctx.client_id)
    if not client then
        return
    end

    on_attach(client, vim.api.nvim_get_current_buf())

    return register_capability(err, res, ctx)
end

vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'Configure LSP keymaps',
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        -- I don't think this can happen but it's a wild world out there.
        if not client then
            return
        end

        on_attach(client, args.buf)
    end,
})

-- Set up LSP servers.
vim.api.nvim_create_autocmd({ 'BufReadPre', 'BufNewFile' }, {
    once = true,
    callback = function()
        -- Extend neovim's client capabilities with the completion ones.
        vim.lsp.config('*', {
            capabilities = require('blink.cmp').get_lsp_capabilities(
                nil,
                true
            ),
        })

        local servers = vim.iter(
            vim.api.nvim_get_runtime_file('lsp/*.lua', true)
        )
            :map(function(file)
                return vim.fn.fnamemodify(file, ':t:r')
            end)
            :totable()
        vim.lsp.enable(servers)
    end,
})

-- HACK: Override buf_request to ignore notifications from LSP servers that don't implement a method.
local buf_request = vim.lsp.buf_request
---@diagnostic disable-next-line: duplicate-set-field
vim.lsp.buf_request = function(bufnr, method, params, handler)
    return buf_request(bufnr, method, params, handler, function() end)
end

return M
