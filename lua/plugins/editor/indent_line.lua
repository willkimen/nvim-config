---@module 'lazy'
---@type LazySpec
return {
  { -- Adiciona guias de indentação mesmo em linhas em branco
    'lukas-reineke/indent-blankline.nvim',
    -- Habilita `lukas-reineke/indent-blankline.nvim`
    -- Veja `:help ibl`
    main = 'ibl',
    ---@module 'ibl'
    ---@type ibl.config
    opts = {},
  },
}
