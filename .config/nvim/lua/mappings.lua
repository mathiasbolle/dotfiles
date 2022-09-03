-- set leader key to space
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.keymap.set('t', '<Esc>', "<C-\\><C-n>")
vim.keymap.set('n', '<leader>n', '<cmd>:NvimTreeToggle<cr>')
vim.keymap.set('n', '<Esc>', '<cmd>:close<cr>')
