return {
  'kevinhwang91/nvim-ufo',
  event = { 'VeryLazy' },
  dependencies = { { 'kevinhwang91/promise-async', lazy = true } },
  config = function()
    local ufo = require 'ufo'
    vim.keymap.set('n', 'zO', ufo.openAllFolds, { noremap = true, silent = true, desc = 'Open All folds' })
    vim.keymap.set('n', 'zC', ufo.closeAllFolds, { noremap = true, silent = true, desc = 'Close all folds' })
    vim.keymap.set('n', 'zo', function()
      ufo.openFoldsExceptKinds {}
    end, { noremap = true, silent = true, desc = 'Fold less' })

    vim.keymap.set('n', 'zc', function()
      ufo.closeFoldsWith(1)
    end, { noremap = true, silent = true, desc = 'Fold more' })

    vim.keymap.set('n', 'zp', function()
      ufo.peekFoldedLinesUnderCursor()
    end, { noremap = true, silent = true, desc = 'Peek fold' })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    }
    local language_servers = vim.lsp.get_clients() -- or list servers manually like {'gopls', 'clangd'}
    for _, ls in ipairs(language_servers) do
      require('lspconfig')[ls].setup {
        capabilities = capabilities,
        -- you can add other fields for setting up lsp server in this table
      }
    end
    require('ufo').setup()
  end,
}
