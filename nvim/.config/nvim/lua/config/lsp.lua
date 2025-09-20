vim.lsp.enable {
    "lua_ls",
    "gdscript"
}

-- Using tiny-diagnostics instead
-- vim.diagnostic.config({
--     virtual_lines = {
--         current_line = true,
--     },
-- })

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)

        -- Not necessary anymore
        -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = ev.buf, desc = "Hover doc" })

        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = ev.buf, desc = "Go to declaration" })
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = ev.buf, desc = "Go to definition" })
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation,
            { buffer = ev.buf, desc = "Go to implementation" })

        -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { buffer = ev.buf, desc = "Signature help" })
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition,
            { buffer = ev.buf, desc = "Type defininition" })
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = ev.buf, desc = "Rename" })
        vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action,
            { buffer = ev.buf, desc = "Code action" })
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = ev.buf, desc = "Go to references" })
        vim.keymap.set('n', '<C-M-l>', function()
            vim.lsp.buf.format { async = true }
        end, { buffer = ev.buf, desc = "Format document" })

        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
            vim.opt.completeopt = { 'menu', 'menuone', 'fuzzy', 'popup' }
            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
            vim.keymap.set('i', '<C-Space>', function()
                vim.lsp.completion.get()
            end)
        end
    end,
})
