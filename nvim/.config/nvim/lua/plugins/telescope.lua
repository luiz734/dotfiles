return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local builtin = require('telescope.builtin')

        require 'telescope'.setup {
            defaults = {
                file_ignore_patterns = {
                    -- godot
                    "**/*.import", "**/*.png", "**/*.ase", "**/*.ttf", "**/*.tscn", "**/*.tres",
                    "venv", "addons", "**/*.gd.uid", "**/*.svg",
                }
            }
        }

        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find file" })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Live grep" })
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Find buffer" })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Find help" })
        vim.keymap.set('n', '<leader>fj', builtin.lsp_document_symbols, { desc = "Find help" })
        vim.keymap.set('n', '<leader>fc', builtin.command_history, { desc = "Find command history" })
        vim.keymap.set('n', '<leader>fy', ":Telescope neoclip<CR>", { silent = true, desc = "Find yanks" })
        vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = "Resume last search" })
    end,
}
