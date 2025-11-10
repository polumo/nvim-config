return {
  -- theme
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      require('catppuccin').setup {
        transparent_background = true,
      }
      vim.cmd.colorscheme 'catppuccin-mocha'
    end,
  },

  -- lualine
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      theme = 'catppuccin',
      globalstatus = true,
      section_separators = '',
      component_separators = '',
    },
  },

  -- icons
  {
    'nvim-tree/nvim-web-devicons',
    lazy = true,
  },

  {
    'mikavilpas/yazi.nvim',
    version = '*',
    event = 'VeryLazy',
    dependencies = {
      { 'nvim-lua/plenary.nvim', lazy = true },
    },
    opts = {},
  },

  {
    'nvim-mini/mini.pick',
    version = false,
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {},
  },

  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    },
    opts = {},
    config = function(_, opts)
      require('notify').setup(vim.tbl_extend('keep', {
        background_colour = '#000000',
      }, opts))
    end,
  },
}
