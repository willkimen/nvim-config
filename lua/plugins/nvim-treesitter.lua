return { -- Realçar, editar e navegar pelo código
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  opts = {
    ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'vim', 'vimdoc', 'python', 'go', 'dart' },
    -- Instalar automaticamente linguagens que não estão instaladas
    auto_install = true,
    highlight = {
      enable = true,
      -- Algumas linguagens dependem do sistema de realce regex do vim (como Ruby) para regras de indentação.
      -- Se você estiver enfrentando problemas estranhos de indentação, adicione a linguagem
      -- à lista de additional_vim_regex_highlighting e desative a indentação para essa linguagem.
      additional_vim_regex_highlighting = { 'ruby' },
    },
    indent = { enable = true, disable = { 'ruby' } },
  },
  config = function(_, opts)
    -- [[ Configurar Treesitter ]] Veja `:help nvim-treesitter`

    -- Prefira git em vez de curl para melhorar a conectividade em alguns ambientes
    require('nvim-treesitter.install').prefer_git = true
    ---@diagnostic disable-next-line: missing-fields
    require('nvim-treesitter.configs').setup(opts)

    -- Existem módulos adicionais do nvim-treesitter que você pode usar para interagir
    -- com nvim-treesitter. Você deve explorar alguns e ver o que te interessa:
    --
    --    - Seleção incremental: Incluído, veja `:help nvim-treesitter-incremental-selection-mod`
    --    - Mostrar o contexto atual: https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + objetos de texto: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  end,
}
