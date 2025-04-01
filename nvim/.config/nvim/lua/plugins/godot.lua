return {
    {
        "luiz734/vim-godot",
        branch = "main",
        event = "VimEnter",
        config = function()
            -- require("vim-godot").setup({})
            -- vim.cmd "set expandtab"
            function GodotFormat()
                vim.cmd('!gdformat %')
            end

            -- Lua
            vim.cmd('command! GodotFormat lua GodotFormat()')
            local gdproject = io.open(vim.fn.getcwd() .. '/project.godot', 'r')
            if gdproject then
                io.close(gdproject)
                vim.fn.serverstart './godothost'
            end
        end
    },
}
