return {
    {
        "luiz734/vim-godot",
        branch = "main",
        event = "VimEnter",
        config = function()
            -- require("vim-godot").setup({})

            -- Lua
            local gdproject = io.open(vim.fn.getcwd() .. '/project.godot', 'r')
            if gdproject then
                io.close(gdproject)
                vim.fn.serverstart './godothost'
            end
        end
    },
}
