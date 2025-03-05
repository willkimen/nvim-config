require 'global' -- Mantenha por primeiro, principalmente antes dos plugins
require 'keymaps'
require 'options'
require 'autocmd'
require 'lazy-setup'

--[[ #################### Configure and install plugins  #######################
--
--  Para verificar os status atual dos plugins, rode esse comando:
--    :Lazy
--
--  Você pode pressionar `?` neste menu para obter ajuda. Use `:q` para fechar a janela
--
--  Para atualizar plug-ins você pode executar
--    :Lazy update
]]

require('lazy').setup({
  require 'plugins.vim-sleuth',
  require 'plugins.comment',
  require 'plugins.which-key',
  require 'plugins.telescope',
  require 'plugins.nvim-lspconfig',
  require 'plugins.conform',
  require 'plugins.nvim-cmp',
  -- require 'plugins.theme-tokyonight',
  -- require 'plugins.theme-catppuccin',
  require 'plugins.todo-comments',
  require 'plugins.mini',
  require 'plugins.nvim-treesitter',
  require 'plugins.debug',
  require 'plugins.indent_line',
  -- require 'plugins.lint',
  require 'plugins.autopairs',
  require 'plugins.neo-tree',
  require 'plugins.gitsigns', -- adds gitsigns recommend keymaps
  'tpope/vim-dotenv',
  require 'plugins.lazydev',
  require 'plugins.luvit-meta',
  require 'plugins.theme-nordic',
  require 'plugins.flutter_tools',
}, {
  ui = {
    -- Se você estiver usando uma Nerd Font: defina icons como uma tabela vazia, que usará
    -- os ícones Nerd Font padrão definidos pelo lazy.nvim. Caso contrário, defina uma tabela com ícones Unicode.
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
