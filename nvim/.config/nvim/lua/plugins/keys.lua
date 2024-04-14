return {
    "tamton-aquib/keys.nvim",
    config = function()
        require("keys").setup {
            enable_on_startup = false,
            win_opts = {
                width = 25
                -- etc
            },
            -- TODO: more options later
        }
    end
}
