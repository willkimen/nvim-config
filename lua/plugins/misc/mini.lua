-- Collection of various small independent plugins/modules

-- Better Around/Inside textobjects
--
-- Examples:
--  - va)  - [V]isually select [A]round [)]paren
--  - yiinq - [Y]ank [I]nside [I]+1 [Q]uote
--  - ci'  - [C]hange [I]nside [']quote
require("mini.ai").setup({
  -- Avoid conflicts with built-in incremental selection mappings
  mappings = {
    around_next = "aa",
    inside_next = "ii",
  },

  n_lines = 500,
})

-- Add/delete/replace surroundings (brackets, quotes, etc.)
--
-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
-- - sd'   - [S]urround [D]elete [']quotes
-- - sr)'  - [S]urround [R]eplace [)] [']
require("mini.surround").setup()

-- Simple and easy statusline.
local statusline = require("mini.statusline")

statusline.setup({
  use_icons = vim.g.have_nerd_font,
})

  -- You can configure sections in the statusline by overriding their
  -- default behavior. For example, here we set the section for
  -- cursor location to LINE:COLUMN
-- Set statusline location format to LINE:COLUMN
  ---@diagnostic disable-next-line: duplicate-set-field
  statusline.section_location = function() return '%2l:%-2v'
end

-- File explorer with column-based navigation
--
-- - Navigate directories using a Miller Columns layout.
-- - Create, delete, rename, copy and move files.
-- - Preview files and directories.
-- - Integrate file operations with LSP servers.
require("mini.files").setup({
  content = {
    -- Filtra arquivos e diretórios que não devem ser exibidos no explorador.
    filter = function(fs_entry)
      -- Nomes específicos de arquivos e diretórios que devem ser ocultados.
      local excluded_names = {
        [".env"] = true,
        [".git"] = true,
        ["__pycache__"] = true,
      }

      -- Extensões de arquivos que devem ser ocultadas.
      local excluded_extensions = {
        [".log"] = true,
        [".pyc"] = true,
        [".tmp"] = true,
      }

      local name = fs_entry.name
      local extension = "." .. vim.fn.fnamemodify(name, ":e")

      -- Exibe o item somente se seu nome e sua extensão não estiverem
      -- presentes nas respectivas listas de exclusão.
      return not excluded_names[name]
        and not excluded_extensions[extension]
    end,
  },

  windows = {
    preview = false,
    width_focus = 40,
    width_nofocus = 20,
    width_preview = 35,
    max_number = 3,
  },

  options = {
    permanent_delete = false,
    use_as_default_explorer = true,
    lsp_timeout = 1000,
  },

  mappings = {
    -- Abre o arquivo selecionado e fecha o explorador.
    go_in_plus = "l",

    -- Entra no diretório ou abre o arquivo sem fechar o explorador.
    go_in = "L",

    -- Sincroniza as alterações pendentes com o sistema de arquivos ao pressionar Enter.
    -- É uma forma de confirmar alguma alteração, como por exemplo uma remoção de um arquivo.
    -- Substitui a tecla padrao = , que faz exatamente isso. 
    sync = "<CR>",
  },
})
