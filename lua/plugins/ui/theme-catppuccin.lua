require("catppuccin").setup({
  -- Theme variant
  flavour = "mocha",

  transparent_background = false,

  -- Highlight styles
  styles = {
    comments = { "italic" },
    conditionals = { "italic" },

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
      indentscope_color = "",
    },
  },
})

vim.cmd.colorscheme("catppuccin")
