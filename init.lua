vim.g.mapleader = ' '

require 'options'
require 'keymaps'

vim.pack.add({
  { src = 'https://github.com/catppuccin/nvim' },
  { src = 'https://github.com/mason-org/mason.nvim' },
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  { src = 'https://github.com/nvim-mini/mini.pick' },
  { src = 'https://github.com/nvim-mini/mini.files' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
  { src = 'https://github.com/nvim-mini/mini.pairs' },
  { src = 'https://github.com/nvim-mini/mini.statusline' },
  { src = 'https://github.com/nvim-mini/mini.indentscope' },
})

vim.pack.add({
}, {
  load = function()
    vim.api.nvim_create_autocmd('InsertEnter', {
      once = true,
      callback = function()
        require('mini.pairs').setup()
      end
    })
  end
})

require('nvim-treesitter.configs').setup({
  ensure_installed = { 'lua', 'python', 'json', 'javascript', 'markdown', 'typescript' },
  sync_install = false,
  auto_install = true,
  ignore_install = {},
  modules = {},
  highlight = { enable = true },
  indent = { enable = true },
})

vim.pack.add({
  { src = 'https://github.com/saghen/blink.cmp', version = vim.version.range('1.*') },
}, {
  load = function(plug_data)
    vim.api.nvim_create_autocmd('InsertEnter', {
      once = true,
      callback = function()
        vim.opt.runtimepath:append(plug_data.path)
        require('blink.cmp').setup({
          keymap = { preset = 'super-tab' },
          sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
          }
        })
      end
    })
  end
})

vim.api.nvim_create_autocmd('VimEnter', {
  once = true,
  callback = function()
    vim.cmd('colorscheme catppuccin-mocha')
    require('mini.statusline').setup()
    require('mini.indentscope').setup()
  end
})

vim.api.nvim_create_autocmd({ 'BufReadPre', 'BufNewFile' }, {
  callback = function()
    require('mason').setup()
    require('mini.pick').setup()
    require('mini.files').setup({
      windows = {
        preview = true,
      }
    })
  end
})

vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT', path = vim.split(package.path, ';') },
      diagnostics = { globals = { 'vim' } },
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true),
        checkThirdParty = false,
      },
      format = { enable = true },
    }
  }
})

vim.lsp.enable({ 'lua_ls', 'pyright' })
vim.diagnostic.config({ virtual_text = true })
-- vim.diagnostic.config({ virtual_lines = true })

-- Format on save
vim.api.nvim_create_autocmd('BufWritePre', {
  callback = function()
    vim.lsp.buf.format()
  end,
  pattern = '*',
})

-- Highlight prompt when copying
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight copying text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank({ timeout = 500 })
  end
})
