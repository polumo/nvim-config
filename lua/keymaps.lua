local setkey = vim.keymap.set

setkey('n', '<Esc>', '<Cmd>nohlsearch<CR>')

setkey('n', '<Leader>w', '<Cmd>w<CR>', { desc = 'Save' })

setkey('n', '<Leader>q', '<Cmd>confirm q<CR>', { desc = 'Quit Window' })
setkey('n', '<Leader>Q', '<Cmd>confirm qall<CR>', { desc = 'Exit Neovim' })

setkey('n', '<Leader>/', 'gcc')

setkey({ 'n', 'v', 'i' }, '<C-z>', '<ESC>u<CR>', { desc = 'undo' })
