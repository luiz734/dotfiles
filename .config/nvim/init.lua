-- Map leader and :
vim.g.mapleader = " "
vim.keymap.set({'n', 'v'}, ';', ':', { })
-- vim.keymap.set({'n' }, '<leader>?', function() print 'working' end, { })
-- vim.keymap.set({'n', 'i' }, '<c-s>', function() vim.cmd 'w' end, { })
-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

vim.keymap.set({'n'}, '<c-[>', function() vim.cmd ':bp' end, { })
vim.keymap.set({'n'}, '<c-]>', function() vim.cmd ':bn' end, { })



--____________ CONFIGURE PLUGINS _____________ --

function load_module(path)
   local ok, _ = pcall(require, path)
   if not ok then
      print('Error loading module: ' .. path)
   end
end

vim.opt.termguicolors = true

-- load_module('plugins')
require('plugins')

-- Color scheme
vim.g.material_style = 'darker' -- VARIABLE
vim.cmd.colorscheme 'material'  -- FUNCTION CALLING

vim.opt.showmode = false   -- equivalent to set noshowmode

vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.wo.number = true
vim.o.relativenumber = true 
vim.o.timeoutlen = 300
vim.o.hlsearch = true

vim.o.mouse = 'a'
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'
vim.o.completeopt = 'menuone,noselect'

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- custom commands
-- vim.api.nvim_add_user_command('Reload', ':w |so % |PackerSync', {})
vim.cmd ":call nvim_create_user_command('Reload', ':w |so % |PackerSync', {})"

