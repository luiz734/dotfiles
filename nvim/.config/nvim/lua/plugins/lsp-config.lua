return
{
    {
        "nvimtools/none-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            -- "nvimtools/none-ls.nvim",
        },
        config = function()
            -- require("mason-none-ls").setup({
            --     ensure_installed = { "black" }
            -- })

            -- local null_ls = require("null-ls")

            -- null_ls.setup({
            --     sources = {
            --         null_ls.builtins.formatting.black,
            --         null_ls.builtins.formatting.prettier,
            --         -- null_ls.builtins.formatting.gdformat,
            --     },
            -- })
        end
    },
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "bashls",
                    "pyright",
                    "html",
                    -- "htmx",
                },
                automatic_installation = true,
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require('lspconfig')

            require('lspconfig').gdscript.setup {}

            lspconfig.lua_ls.setup({
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' }
                        }
                    }
                }
            })
            lspconfig.gopls.setup({})
            lspconfig.html.setup({
                -- Fix html auto completion not working
                capabilities = require('cmp_nvim_lsp').default_capabilities(),
            })
            -- lspconfig.htmx.setup({})
            lspconfig.pyright.setup {}
            lspconfig.bashls.setup({
                filetypes = { "sh", }
            })
            lspconfig.gdscript.setup { capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()) }

            lspconfig.cssls.setup {
                filetypes = { "css" }
            }
            lspconfig.jsonls.setup {
                filetypes = { "json" }
            }
            lspconfig.eslint.setup {
                filetypes = { "javascript" }
            }

            vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)

            -- Not necessary after 0.10
            -- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Diagnostic prev" })
            -- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Diagnostic next" })

            -- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(ev)
                    -- Enable completion triggered by <c-x><c-o>
                    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                    -- Buffer local mappings.
                    -- See `:help vim.lsp.*` for documentation on any of the below functions
                    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = ev.buf, desc = "Go to declaration" })
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = ev.buf, desc = "Go to definition" })
                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = ev.buf, desc = "Hover doc" })
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
                end,
            })
        end
    }
}
