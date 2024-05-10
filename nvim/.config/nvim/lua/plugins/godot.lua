return {
    "habamax/vim-godot",
    event = "VimEnter",
    config = function()
        -- require("vim-godot").setup({})
        function GodotFormat()
            vim.cmd('!gdformat %')
        end
        -- Lua
        vim.cmd('command! GodotFormat lua GodotFormat()')
    end
}
