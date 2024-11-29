vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.g.mapleader = " "
vim.g.background = "light"

vim.opt.swapfile = false

-- Navigate vim panes better
-- moved to smart-splits.lua

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.wo.number = true

