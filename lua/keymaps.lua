local setkey = vim.keymap.set

setkey('n', '<Esc>', '<Cmd>nohlsearch<CR>')

setkey('n', '<Leader>w', '<Cmd>w<CR>', { desc = 'Save' })

setkey('n', '<Leader>q', '<Cmd>confirm q<CR>', { desc = 'Quit Window' })
setkey('n', '<Leader>Q', '<Cmd>confirm qall<CR>', { desc = 'Exit Neovim' })

setkey('n', '<Leader>/', 'gcc', { remap = true, desc = 'Toggle comment line' })
setkey('x', '<Leader>/', 'gc', { remap = true, desc = 'Toggle comment' })

setkey({ 'n', 'v', 'i' }, '<C-z>', '<ESC>u<CR>', { desc = 'undo' })

-- LSP 相关快捷键
setkey('n', '<Leader>lf', function()
  vim.lsp.buf.format()
end, { desc = 'Format' })
setkey('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
setkey('n', 'gD', vim.lsp.buf.declaration, { desc = 'Go to declaration' })
setkey('n', 'gi', vim.lsp.buf.implementation, { desc = 'Go to implementation' })
setkey('n', 'gr', vim.lsp.buf.references, { desc = 'Find references' })
setkey('n', '<Leader>rn', vim.lsp.buf.rename, { desc = 'Rename symbol' })
setkey('n', '<Leader>ca', vim.lsp.buf.code_action, { desc = 'LSP code action' })

setkey('n', '<Leader>e', ':lua MiniFiles.open()<CR>', { desc = 'Open file enplorer' })
setkey('n', '<Leader>f', ':Pick files<CR>', { desc = 'Open file picker' })
setkey('n', '<Leader>b', ':Pick buffers<CR>', { desc = 'Open buffer picker' })

-- Move line
vim.keymap.set('n', '<A-j>', ':m .+1<CR>==', { desc = 'Move line down' })
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==', { desc = 'Move line up' })
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })
