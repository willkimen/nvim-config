return { -- ############## Autoformat ###########################
  'stevearc/conform.nvim',
  lazy = false,
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true, lsp_fallback = true }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      local disable_filetypes = { c = true, cpp = true }
      return {
        timeout_ms = 500,
        lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
      }
    end,
    formatters_by_ft = {
      lua = { 'stylua' },
      python = {
        'isort',
        'black',
        stop_after_first = false, -- Adiciona essa linha, se true, para no primeiro formatador, se false, vai passar por todos os formatores
      },
    },
    linters_by_ft = {
      python = {
        'flake8',
        args = { '--max-line-length', '88', '--ignore', 'E203,W503' },
      },
    },
  },
}
