return
{
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    opts = {},
    config = function()
        require("hardtime").setup({
            disabled_keys = {
                ["<Up>"] = {},
                ["<Left>"] = {},
            }
        })
    end
}
