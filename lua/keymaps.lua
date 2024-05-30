local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', opts)
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', opts)
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', opts)
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', opts)
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', opts)
vim.keymap.set('i', 'jk', '<ESC>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)
vim.keymap.set('n', '<C-Up>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize -2<CR>', opts)

-- neotree
vim.keymap.set('n', '<leader>e', '<cmd>Neotree toggle<cr>', opts)
vim.keymap.set('n', '<leader>o', '<cmd>Neotree reveal<cr>', opts)

-- toggleterm
vim.keymap.set('n', '<leader>tf', '<cmd>ToggleTerm direction=float<cr>', opts)
vim.keymap.set('n', '<leader>th', '<cmd>ToggleTerm direction=horizontal<cr>', opts)
