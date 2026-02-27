-- Neo-tree é um plugin do Neovim para navegar no sistema de arquivos
-- https://github.com/nvim-neo-tree/neo-tree.nvim

---@module 'lazy'
---@type LazySpec
return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- não é estritamente necessário, mas recomendado
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  ---@module 'neo-tree'
  ---@type neotree.Config
  opts = {
    window = {
      position = 'float', -- define o modo flutuante como padrão
    },
    filesystem = {
      window = {
        mappings = {
          ['\\'] = 'close_window',
        },
      },
      -- Mostrará arquivos ocultos, arquivos ignorados pelo Git e arquivos que são normalmente ocultos.
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_hidden = false,
        -- Esconde esses diretorios e arquivos
        hide_by_name = {
          '__pycache__',
          '.ruff_cache',
          '.pytest_cache',
        }, -- end hide_by_name
        -- Esconde a mensagem que mostra quantos items ficaram ocultos
        show_hidden_count = false,
        -- hide_by_pattern = {
        --  '*_test.go',
        -- },
      }, -- end filtered_items
    },
  },
}
