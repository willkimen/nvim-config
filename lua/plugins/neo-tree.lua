-- Neo-tree é um plugin do Neovim para navegar no sistema de arquivos
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- não é estritamente necessário, mas recomendado
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal<CR>', { desc = 'Revelar NeoTree' } }, -- Se inserir silent = true , gera problema no gitsins, nao sei porque
  },
  opts = {
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
      },
    },
  },
}
