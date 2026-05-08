---@module 'lazy'
---@type LazySpec
require("lazy").setup({
  -- Treesitter
  require("plugins.treesitter.nvim-treesitter"),
  require("plugins.treesitter.ts-autotag"),

  -- LSP / tooling
  require("plugins.lsp.nvim-lspconfig"),
  require("plugins.lsp.lint"),
  require("plugins.lsp.conform"),
  -- require("plugins.lsp.flutter_tools"),

  -- Navegação
  require("plugins.ui.neo-tree"),
  require("plugins.ui.telescope"),

  -- UI / visual
  require("plugins.ui.theme-catppuccin"),
  -- require("plugins.ui.theme-github"),
  -- require("plugins.ui.theme-nordic"),
  -- require("plugins.ui.theme-tokyonight"),
  require("plugins.ui.barbar"),

  -- Git
  require("plugins.git.gitsigns"),

  -- Editor
  require("plugins.editor.which-key"),
  require("plugins.editor.comment"),
  require("plugins.editor.autopairs"),
  require("plugins.editor.guess-indent"),
  require("plugins.editor.todo-comments"),
  require("plugins.editor.indent_line"),

  -- Autocomplete / Lua
  require("plugins.misc.luvit-meta"),
  require("plugins.misc.saghen-blink-cmp"),
  require("plugins.misc.mini"),

  -- Debug
  require("plugins.debug.debug"),

  "tpope/vim-dotenv",
}, { ---@diagnostic disable-line: missing-fields
  ui = {
    icons = vim.g.have_nerd_font and {} or {},
  },
})
