return {
  'catppuccin/nvim',
  as = 'catppuccin',
  config = function()
    require('catppuccin').setup {
      -- Configurações opcionais
      flavour = 'mocha', -- Opções: latte, frappe, macchiato, mocha
      transparent_background = false,
      styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { 'italic' }, -- Change the style of comments
        conditionals = { 'italic' },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
      integrations = {
        gitsigns = true,
        mini = {
          enabled = true,
          indentscope_color = '',
        },
      },
    }
    vim.cmd.colorscheme 'catppuccin'
  end,
}
