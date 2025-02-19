return { -- ############### Finder Fuzzy (arquivos, lsp, etc) #####################
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { -- Se encontrar erros, veja as instruções de instalação no README do telescope-fzf-native
      'nvim-telescope/telescope-fzf-native.nvim',

      -- `build` é usado para executar um comando quando o plugin é instalado/atualizado.
      -- Isso só é executado então, não toda vez que o Neovim é iniciado.
      build = 'make',

      -- `cond` é uma condição usada para determinar se este plugin deve ser
      -- instalado e carregado.
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },

    -- Útil para obter ícones bonitos, mas requer uma Nerd Font.
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  config = function()
    -- Telescope é um finder fuzzy que vem com muitas coisas diferentes que
    -- ele pode encontrar fuzzy! É mais do que apenas um "localizador de arquivos", ele pode buscar
    -- muitos aspectos diferentes do Neovim, seu workspace, LSP, e mais!
    --
    -- A maneira mais fácil de usar o Telescope é começar fazendo algo como:
    --  :Telescope help_tags
    --
    -- Após executar este comando, uma janela se abrirá e você poderá
    -- digitar na janela de prompt. Você verá uma lista de opções `help_tags` e
    -- uma pré-visualização correspondente da ajuda.
    --
    -- Dois mapeamentos de teclas importantes para usar enquanto estiver no Telescope são:
    --  - Modo de inserção: <c-/>
    --  - Modo normal: ?
    --
    -- Isso abre uma janela que mostra todos os mapeamentos de teclas para o picker
    -- atual do Telescope. Isso é realmente útil para descobrir o que o Telescope pode
    -- fazer, bem como como realmente fazer isso!

    -- [[ Configurar Telescope ]]
    -- Veja `:help telescope` e `:help telescope.setup()`
    require('telescope').setup {
      -- Você pode colocar seus mapeamentos/atualizações/etc. padrão aqui
      -- Todas as informações que você está procurando estão em `:help telescope.setup()`
      defaults = {
        -- Telescope ignora esses diretórios e arquivos globalmente
        file_ignore_patterns = { 'venv', '.venv', '%.git', 'vendor', 'target', 'node_modules', 'dist', 'build' },
      },

      pickers = {

        find_files = {
          hidden = true, -- Ativa o telescope buscar por arquivos ocultos
          file_ignore_patterns = { 'venv', '.venv', '%.git', 'vendor', 'target', 'node_modules', 'dist', 'build' }, -- Com exceção desses
        },
      },
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }

    -- Habilitar extensões do Telescope se elas estiverem instaladas
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    -- Veja `:help telescope.builtin`
    local builtin = require 'telescope.builtin'
    vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
    vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
    vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
    vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
    vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
    vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Encontrar buffers existentes' })

    -- Exemplo ligeiramente avançado de sobrescrever o comportamento e tema padrão
    vim.keymap.set('n', '<leader>/', function()
      -- Você pode passar configurações adicionais para o Telescope para mudar o tema, layout, etc.
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = '[/] Buscar fuzzy no buffer atual' })

    -- Também é possível passar opções de configuração adicionais.
    -- Veja `:help telescope.builtin.live_grep()` para informações sobre chaves específicas
    vim.keymap.set('n', '<leader>s/', function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end, { desc = '[S]earch [/] in Open Files' })

    -- Atalho para buscar seus arquivos de configuração do Neovim
    vim.keymap.set('n', '<leader>sn', function()
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end, { desc = '[S]earch [N]eovim files' })
  end,
}
