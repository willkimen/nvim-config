require 'global' -- Mantenha por primeiro, principalmente antes dos plugins
require 'keymaps'
require 'options' -- Mantenha por primeiro, principalmente antes dos plugins
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
  -- ============== TS e LSP ==========
  require 'plugins.nvim-treesitter',
  require 'plugins.nvim-lspconfig',
  require 'plugins.lazydev', -- Fornece suporte LSP para arquivos Lua no Neovim

  -- =========== Navegação ===========
  require 'plugins.neo-tree',
  require 'plugins.telescope',

  -- ======== Estilo ==============
  -- require 'plugins.theme-catppuccin',
  -- require 'plugins.theme-nordic',
  require 'plugins.theme-tokyonight',
  require 'plugins.barbar',
  require 'plugins.gitsigns', -- Atalhos relacionado a git

  -- ============== Others ==========
  require 'plugins.which-key', -- Mostra uma janela interativa com os atalhos disponíveis
  require 'plugins.debug', -- Debug
  -- require 'plugins.flutter_tools',

  -- ============ Formatação e Código =========
  require 'plugins.luvit-meta', -- Melhora a autocompletação em Lua
  require 'plugins.saghen-blink-cmp', -- autocomplete
  require 'plugins.comment', -- Cria comentarios no codigo por meio de comandos
  require 'plugins.autopairs', -- Cria automaticamente pares de [], {} e etc
  require 'plugins.lint', -- Lint
  require 'plugins.conform', -- Formatadores
  require 'plugins.guess-indent', -- Indentacao
  require 'plugins.todo-comments', -- todo coloridos em comentarios
  require 'plugins.indent_line', -- Guias visuais de indentacao
  require 'plugins.mini', -- Lida com o codigo como objetos, podendo navegar e modificar de forma mais simples
  'tpope/vim-dotenv', -- Carrega variáveis de arquivos `.env` para o ambiente do Vim/Neovim.
}, {
  ui = {
    -- Se você estiver usando uma Nerd Font: defina icons como uma tabela vazia, que usará
    -- os ícones Nerd Font padrão definidos pelo lazy.nvim. Caso contrário, defina uma tabela com ícones Unicode.
    -- Eu removi os icones que vem por padrao e deixei a tabela em braco, ali na ultima tabela
    icons = vim.g.have_nerd_font and {} or {},
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
