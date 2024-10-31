return
{
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
        {
            "<leader>xx",
            "<cmd>Trouble diagnostics toggle focus=true win.position=bottom<cr>",
            desc = "Diagnostics (Trouble)",
        },
        {
            "<leader>cs",
            "<cmd>Trouble symbols toggle focus=true<cr>",
            desc = "Symbols (Trouble)",
        },
        -- {
        --     "<leader>xQ",
        --     "<cmd>Trouble teles toggle<cr>",
        --     desc = "Quickfix List (Trouble)",
        -- },
    },
    config = function()
        require("trouble").setup {
            modes = {
                symbols = {     -- Configure symbols mode
                    win = {
                        type = "split", -- split window
                        relative = "win", -- relative to current window
                        position = "right", -- right side
                        size = 0.3, -- 30% of the window
                    },
                },
            },
        }
    end
}
