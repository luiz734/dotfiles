return {
    "nvim-treesitter/nvim-treesitter", 
    branch = 'master', 
    lazy = false, 
    build = ":TSUpdate",
    opts = {
        ensure_instaled = { "lua", "c", "vim", "markdown" },
        auto_install = true,
        highlight = { enabled = true },
        indent = { enabled = true },
        incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = false,
                    node_incremental = "v",
                    node_decremental = "V",
                    scope_incremental = false,
                },
        },
    },
}
