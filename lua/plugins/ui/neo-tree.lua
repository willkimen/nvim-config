-- Neo-tree é um plugin do Neovim para navegar no sistema de arquivos
-- https://github.com/nvim-neo-tree/neo-tree.nvim
--
vim.pack.add {
  { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim', version = vim.version.range '*' },
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
}

vim.keymap.set(
  "n",
  "\\",
  "<cmd>Neotree reveal<CR>",
  {
    desc = "NeoTree reveal",
    silent = true,
  }
)

require("neo-tree").setup({
  window = {
    position = "float",
  },

  filesystem = {
    window = {
      mappings = {
        ["\\"] = "close_window",
      },
    },

    -- Mostrará arquivos ocultos, ignorados pelo Git e ocultos do sistema
    filtered_items = {
      hide_dotfiles = false,
      hide_gitignored = false,
      hide_hidden = false,

      -- Diretórios e arquivos escondidos
      hide_by_name = {
        "__pycache__",
        ".ruff_cache",
        ".pytest_cache",
      },

      -- Esconde contador de itens ocultos
      show_hidden_count = false,

      -- hide_by_pattern = {
      --   "*_test.go",
      -- },
    },
  },
})
