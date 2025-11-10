-- Highlight prompt when copying
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- LSP 快捷键
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
  callback = function(event)
    local map = function(keys, func, desc, mode)
      mode = mode or 'n'
      vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
    end

    map('<Leader>lf', function()
      require('conform').format { async = true, lsp_format = 'fallback' }
    end, 'Format')
    map('gd', vim.lsp.buf.definition, 'Go to definition')
    map('gD', vim.lsp.buf.declaration, 'Go to declaration')
    map('gi', vim.lsp.buf.implementation, 'Go to implementation')
    map('gr', vim.lsp.buf.references, 'Find references')
    map('<Leader>rn', vim.lsp.buf.rename, 'Rename symbol')
    map('<Leader>ca', vim.lsp.buf.code_action, 'LSP code action')
  end,
})
