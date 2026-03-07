return {
  {
    'olimorris/codecompanion.nvim',
    lazy = true, -- don’t load at startup
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'ravitemer/mcphub.nvim',
    },

    -- these commands will auto-load the plugin
    cmd = {
      'CodeCompanion', -- base command (for /explain, /fixcode, …)
      'CodeCompanionChat', -- Chat
      'CodeCompanionActions', -- Actions
    },

    -- these keymaps will also auto-load the plugin
    keys = {
      {
        '<leader>ac',
        '<cmd>CodeCompanionChat<CR>',
        mode = 'n',
        desc = '🗨️  CodeCompanion Chat',
      },
      {
        '<leader>aa',
        '<cmd>CodeCompanionActions<CR>',
        mode = 'n',
        desc = '⚙️  CodeCompanion Actions',
      },
      {
        '<leader>ae',
        '<cmd>CodeCompanion /explain<CR>',
        mode = 'n',
        desc = '📝  Explain Code',
      },
      {
        '<leader>af',
        '<cmd>CodeCompanion /fixcode<CR>',
        mode = 'n',
        desc = '🔧  Fix Code',
      },
      {
        '<leader>af',
        '<cmd>CodeCompanion /fixcode<CR>',
        mode = 'v',
        desc = '🔧  Fix Code (visual)',
      },
    },

    opts = {
      extensions = {
        mcphub = {
          callback = 'mcphub.extensions.codecompanion',
          opts = {
            make_vars = true,
            make_slash_commands = true,
            show_result_in_chat = true,
          },
        },
      },
      strategies = {
        chat = {
          adapter = {
            name = 'openai',
            model = 'gpt-5.2',
          },
          keymaps = {
            options = {
              modes = { n = '?' },
              callback = function()
                require('which-key').show { global = false }
              end,
              description = 'CodeCompanion Keymaps',
              hide = true,
            },
          },
        },
        inline = {
          adapter = 'openai',
        },
      },
    },
  },
}
