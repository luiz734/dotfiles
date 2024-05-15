return {
    "nvim-pack/nvim-spectre",
    config = function()
        require 'spectre'.setup {}

        -- toggle
        vim.keymap.set('n', '<leader>ss', '<cmd>lua require("spectre").toggle()<CR>',
            { desc = "Toggle Spectre" })

        -- normal | word | any file
        vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
            desc = "Search current word"
        })
        -- normal | word | current file
        vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
            desc = "Search on current file"
        })

        -- visual | word
        vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
            desc = "Search current word"
        })
        vim.keymap.set('v', '<leader>sp', '<esc><cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
            desc = "Search current word"
        })

    end
}
