vim.pack.add({
  -- Editor
  "https://github.com/windwp/nvim-autopairs",
  "https://github.com/hrsh7th/nvim-cmp",
  "https://github.com/numToStr/Comment.nvim",
  "https://github.com/NMAC427/guess-indent.nvim",
  "https://github.com/lukas-reineke/indent-blankline.nvim",
  "https://github.com/folke/todo-comments.nvim",
  "https://github.com/folke/which-key.nvim",

  -- Shared dependencies
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/MunifTanjim/nui.nvim",

  -- Git
  "https://github.com/lewis6991/gitsigns.nvim",

  -- Formatting / linting
  "https://github.com/stevearc/conform.nvim",
  "https://github.com/mfussenegger/nvim-lint",

  -- LSP
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/mason-org/mason-lspconfig.nvim",
  "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
  "https://github.com/j-hui/fidget.nvim",

  -- Lua / completion
  "https://github.com/Bilal2453/luvit-meta",
  "https://github.com/nvim-mini/mini.nvim",
  "https://github.com/saghen/blink.cmp",
  "https://github.com/saghen/blink.lib",
  "https://github.com/L3MON4D3/LuaSnip",

  -- Treesitter
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/windwp/nvim-ts-autotag",

  -- UI
  "https://github.com/romgrk/barbar.nvim",
  "https://github.com/nvim-neo-tree/neo-tree.nvim",
  "https://github.com/nvim-telescope/telescope.nvim",
  "https://github.com/nvim-telescope/telescope-ui-select.nvim",
  "https://github.com/catppuccin/nvim",

  "https://github.com/tpope/vim-dotenv",
})

if vim.g.have_nerd_font then
  require('mini.icons').setup()
  -- Used for backwards compatibility with plugins that require `nvim-web-devicons` (e.g. telescope.nvim)
  MiniIcons.mock_nvim_web_devicons()
end

if vim.fn.executable("make") == 1 then
  vim.pack.add({
    "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  })
end

-- Executa as configurações
-- Treesitter
require("plugins.treesitter.nvim-treesitter")
require("plugins.treesitter.ts-autotag")


-- LSP / tooling
require("plugins.lsp.nvim-lspconfig")
require("plugins.lsp.lint")
require("plugins.lsp.conform")

-- Navegação
require("plugins.ui.neo-tree")
require("plugins.ui.telescope")

-- UI / visual
require("plugins.ui.theme-catppuccin")
require("plugins.ui.barbar")

-- Git
require("plugins.git.gitsigns")

-- Editor
require("plugins.editor.which-key")
require("plugins.editor.comment")
require("plugins.editor.autopairs")
require("plugins.editor.guess-indent")
require("plugins.editor.todo-comments")
require("plugins.editor.indent_line")

-- Autocomplete / Lua
require("plugins.misc.saghen-blink-cmp")
require("plugins.misc.mini")
