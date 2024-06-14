-- debug.lua
--
-- Mostra como usar o plugin DAP para depurar seu código.
--
-- Principalmente focado em configurar o depurador para Go, mas pode
-- ser estendido para outras linguagens também. É por isso que se chama
-- kickstart.nvim e não kitchen-sink.nvim ;)

return {
  -- NOTA: Sim, você pode instalar novos plugins aqui!
  'mfussenegger/nvim-dap',
  -- NOTA: E você pode especificar dependências também
  dependencies = {
    -- Cria uma bela interface de depuração
    'rcarriga/nvim-dap-ui',

    -- Dependência necessária para nvim-dap-ui
    'nvim-neotest/nvim-nio',

    -- Instala os adaptadores de depuração para você
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',

    -- Adicione seus próprios depuradores aqui
    'leoluz/nvim-dap-go',
    'mfussenegger/nvim-dap-python',
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    require('mason-nvim-dap').setup {
      -- Faz o melhor esforço para configurar os vários depuradores com
      -- configurações de depuração razoáveis
      automatic_installation = true,

      -- Você pode fornecer configuração adicional para os manipuladores,
      -- veja o README do mason-nvim-dap para mais informações
      handlers = {},

      -- Você precisará verificar se tem as coisas necessárias instaladas
      -- online, por favor, não me pergunte como instalá-las :)
      ensure_installed = {
        -- Atualize isso para garantir que você tenha os depuradores para as linguagens que você deseja
        'delve', -- for Go
  	'debugpy', -- for Python
      },
    }

    -- Mapas de teclas básicos para depuração, sinta-se à vontade para alterar conforme sua preferência!
    vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Depurar: Iniciar/Continuar' })
    vim.keymap.set('n', '<F1>', dap.step_into, { desc = 'Depurar: Entrar' })
    vim.keymap.set('n', '<F2>', dap.step_over, { desc = 'Depurar: Passar por cima' })
    vim.keymap.set('n', '<F3>', dap.step_out, { desc = 'Depurar: Sair' })
    vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = 'Depurar: Alternar Ponto de Interrupção' })
    vim.keymap.set('n', '<leader>B', function()
      dap.set_breakpoint(vim.fn.input 'Condição do Ponto de Interrupção: ')
    end, { desc = 'Depurar: Definir Ponto de Interrupção' })

    -- Configuração da UI do Dap
    -- Para mais informações, veja |:help nvim-dap-ui|
    dapui.setup {
      -- Defina ícones para caracteres que são mais propensos a funcionar em qualquer terminal.
      --    Sinta-se à vontade para remover ou usar os que você gostar mais! :)
      --    Não sinta que essas são boas escolhas.
      icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
      controls = {
        icons = {
          pause = '⏸',
          play = '▶',
          step_into = '⏎',
          step_over = '⏭',
          step_out = '⏮',
          step_back = 'b',
          run_last = '▶▶',
          terminate = '⏹',
          disconnect = '⏏',
        },
      },
    }

    -- Alternar para ver o resultado da última sessão. Sem isso, você não pode ver a saída da sessão em caso de exceção não tratada.
    vim.keymap.set('n', '<F7>', dapui.toggle, { desc = 'Depurar: Ver resultado da última sessão.' })

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close

    -- Instalar configuração específica para golang
    require('dap-go').setup {
      delve = {
        -- No Windows, delve deve ser executado anexado ou ele falha.
        -- Veja https://github.com/leoluz/nvim-dap-go/blob/main/README.md#configuring
        detached = vim.fn.has 'win32' == 0,
      },
    }
    
    -- Install python specific config
    require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
  end,
}

