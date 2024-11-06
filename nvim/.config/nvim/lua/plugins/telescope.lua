return
{
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('telescope').setup {
                defaults = {
                    layout_strategy = 'flex',
                    file_ignore_patterns = { "^addons/",
                        -- godot
                        "**/*.import", "**/*.png", "**/*.ase", "**/*.ttf", "**/*.tscn", "**/*.tres",
                        "venv"
                    }
                },
                -- pickers = {
                --     find_files = {
                --         hidden = true
                --     },
                --     live_grep = {
                --         hidden = true
                --     }
                -- }
            }

            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find file" })
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Live grep" })
            vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Find buffer" })
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Find help" })
            vim.keymap.set('n', '<leader>fc', builtin.command_history, { desc = "Find command history" })
            vim.keymap.set('n', '<leader>fy', ":Telescope neoclip<CR>", { silent = true, desc = "Find yanks" })
            vim.keymap.set('n', '<leader>fq', ":Telescope macroscope<CR>", { silent = true, desc = "Find macros" })
            vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = "Resume last search" })
            vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, { desc = "" })
            vim.keymap.set('n', '<leader>ft', ":TodoTelescope<CR>", { silent = true, desc = "Find macros" })

            vim.keymap.set("n", "<leader>lh", function()
                if vim.fn.has "nvim-0.10" == 1 then
                    local ok = pcall(vim.lsp.inlay_hint.enable, vim.lsp.inlay_hint.is_enabled())
                    if ok then
                        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
                    else
                        vim.lsp.inlay_hint.enable(0, not vim.lsp.inlay_hint.is_enabled())
                    end
                end
            end, { desc = "LSP | Toggle Inlay Hints", silent = true })
        end
    },
    {
        'nvim-telescope/telescope-ui-select.nvim',
        config = function()
            -- This is your opts table
            require("telescope").setup {
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {
                        }
                    }
                }
            }
            require("telescope").load_extension("ui-select")
        end
    },
    --lazy

    -- {
    --     "nvim-telescope/telescope-file-browser.nvim",
    --     dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    --     config = function()
    --         vim.api.nvim_set_keymap(
    --             "n",
    --             "<space>fe",
    --             ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
    --             { noremap = true, desc = "File browser" }
    --         )
    --     end
    -- }
    --
}
