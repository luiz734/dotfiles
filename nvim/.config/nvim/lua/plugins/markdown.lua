-- return {}
-- install without yarn or npm
return
{
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
}
-- return
-- {
--     "iamcco/markdown-preview.nvim",
--     cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
--     ft = { "markdown" },
--     build = function(plugin)
--         if vim.fn.executable "npx" then
--             vim.cmd("!cd " .. plugin.dir .. " && cd app && npx --yes yarn install")
--         else
--             vim.cmd [[Lazy load markdown-preview.nvim]]
--             vim.fn["mkdp#util#install"]()
--         end
--     end,
--     init = function()
--         if vim.fn.executable "npx" then vim.g.mkdp_filetypes = { "markdown" } end
--     end,
--     -- for this to work, you need a firefox profile called "empty"
--     -- used to hide topbar
--     config = function()
--         vim.api.nvim_exec([[
--         function OpenMarkdownPreview (url)
--             execute "silent ! firefox --new-window " . a:url
--         endfunction
--         let g:mkdp_browserfunc = 'OpenMarkdownPreview'
--         ]], false)
--     end
-- }
