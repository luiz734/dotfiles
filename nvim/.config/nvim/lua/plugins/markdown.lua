return
{
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
    -- for this to work, you need a firefox profile called "empty"
    -- used to hide topbar
    config = function()
        vim.api.nvim_exec([[
        function OpenMarkdownPreview (url)
            execute "silent ! firefox --new-window " . a:url
        endfunction
        let g:mkdp_browserfunc = 'OpenMarkdownPreview'
        ]], false)
    end
}
