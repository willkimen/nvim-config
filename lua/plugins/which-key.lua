return { -- ############### Plugin útil para mostrar combinações de teclas pendentes. ##################
  'folke/which-key.nvim',
  event = 'VimEnter', -- Define o evento de carregamento como 'VimEnter'
  config = function() -- Esta é a função que é executada APÓS o carregamento
    require('which-key').setup()

    -- Documenta combinações de teclas existentes
    require('which-key').add {
      { '<leader>c', group = '[C]ode' },
      { '<leader>d', group = '[D]ocument' },
      { '<leader>r', group = '[R]ename' },
      { '<leader>s', group = '[S]earch' },
      { '<leader>w', group = '[W]orkspace' },
      { '<leader>t', group = '[T]oggle' },
      { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
    }
  end,
}
