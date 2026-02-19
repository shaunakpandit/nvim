return {
  'metalelf0/black-metal-theme-neovim',
  lazy = false,
  priority = 1,
  config = function()
    require('black-metal').setup {
      theme = 'immortal',
      -- Can be one of: 'light' | 'dark', or set via vim.o.background
      variant = 'dark',
    }
    require('black-metal').load()
  end,
}
