local setkey = vim.keymap.set
local opts = { noremap = true, silent = true }

-- 清除搜索高亮
setkey('n', '<Esc>', '<Cmd>nohlsearch<CR>', opts)

-- 文件操作
setkey('n', '<Leader>w', '<Cmd>w<CR>', vim.tbl_extend('force', opts, { desc = 'Save' }))
setkey('n', '<Leader>q', '<Cmd>confirm q<CR>', vim.tbl_extend('force', opts, { desc = 'Quit Window' }))
setkey('n', '<Leader>Q', '<Cmd>confirm qall<CR>', vim.tbl_extend('force', opts, { desc = 'Exit Neovim' }))

-- 注释
setkey('n', '<Leader>/', 'gcc', vim.tbl_extend('force', opts, { remap = true, desc = 'Toggle comment line' }))
setkey('x', '<Leader>/', 'gc', vim.tbl_extend('force', opts, { remap = true, desc = 'Toggle comment selection' }))

-- 撤销
setkey({ 'n', 'v', 'i' }, '<C-z>', '<ESC>u<CR>', vim.tbl_extend('force', opts, { desc = 'Undo' }))

-- 文件/缓冲区管理
setkey('n', '<Leader>e', '<Cmd>Yazi<CR>', vim.tbl_extend('force', opts, { desc = 'Open file explorer' }))
setkey('n', '<Leader>f', '<Cmd>Pick files<CR>', vim.tbl_extend('force', opts, { desc = 'Open file picker' }))
setkey('n', '<Leader>b', '<Cmd>Pick buffers<CR>', vim.tbl_extend('force', opts, { desc = 'Open buffer picker' }))

-- 移动行/选区
setkey('n', '<A-j>', '<Cmd>m .+1<CR>==', vim.tbl_extend('force', opts, { desc = 'Move line down' }))
setkey('n', '<A-k>', '<Cmd>m .-2<CR>==', vim.tbl_extend('force', opts, { desc = 'Move line up' }))
setkey('v', '<A-j>', "<Cmd>m '>+1<CR>gv=gv", vim.tbl_extend('force', opts, { desc = 'Move selection down' }))
setkey('v', '<A-k>', "<Cmd>m '<-2<CR>gv=gv", vim.tbl_extend('force', opts, { desc = 'Move selection up' }))
