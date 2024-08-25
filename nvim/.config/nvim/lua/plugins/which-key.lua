return
{
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 500
    end,
    opts = {
    },
    config = function()
        require 'which-key'.setup {
            win = {
                border = "none", -- none, single, double, shadow
                -- position = "bottom", -- bottom, top
                -- margin = { 1, 20, 1, 10 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
                padding = { 2, 3, 2, 3 }, -- extra window padding [top, right, bottom, left]
                wo = {
                    winblend = 2,         -- value between 0-100 0 for fully opaque and 100 for fully transparent
                },
                zindex = 1000,            -- positive value to position WhichKey above other floating windows.
            },
            layout = {
                height = { min = 5, max = 25 }, -- min and max height of the columns
                width = { min = 8, max = 50 },  -- min and max width of the columns
                spacing = 8,                    -- spacing between columns
                align = "center",               -- align columns left, center or right
            },
            -- ignore_missing = false,                                                     -- enable this to hide mappings for which you didn't specify a label
            -- hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "^:", "^ ", "^call ", "^lua " }, -- hide mapping boilerplate
            show_help = true, -- show a help message in the command line for using WhichKey
            show_keys = true, -- show the currently pressed key and its label as a message in the command line
            -- triggers = "auto",                                                          -- automatically setup triggers
        }
    end
}
