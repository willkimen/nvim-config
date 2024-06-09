return { --###################  Collection of various small independent plugins/modules  ##########################
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [']quote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()

      --[[Status online ]]
      -- Linha de status simples e fácil.
      -- Você pode remover esta chamada de configuração se não gostar dela,
      --  e experimentar algum outro plugin statusline
      local statusline = require 'mini.statusline'
      -- defina use_icons como true se você tiver uma fonte Nerd
      statusline.setup { use_icons = vim.g.have_nerd_font }

      -- Você pode configurar seções na linha de status substituindo seu
      -- comportamento padrão. Por exemplo, aqui definimos a seção para
      -- localização do cursor para LINE:COLUMN
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end

      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  }
