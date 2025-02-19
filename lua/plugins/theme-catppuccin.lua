return {
  'catppuccin/nvim',
  as = 'catppuccin',
  config = function()
    require('catppuccin').setup {
      -- Configurações opcionais
      flavour = 'mocha', -- Opções: latte, frappe, macchiato, mocha
    }
    vim.cmd.colorscheme 'catppuccin'
  end,
}
