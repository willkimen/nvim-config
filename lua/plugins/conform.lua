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
      -- Essa função serve para aplicar os formatadores e lintes sempre que você
      -- salva o buffer, menos para arquivos .c e .cpp.
      format_on_save = function(bufnr)
        local disable_filetypes = { c = true, cpp = true }
        return {
          timeout_ms = 500,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,
      -- Formatadores de código
      formatters_by_ft = {
        lua = { 'stylua' },
        python = { 
	   {
	   "isort",
	   args = { "--profile", "black", "--line-length", "88" }
	   },
	   {
	   "black",
	   args = { "--line-length", "88", }
	   }
        },
        --
        -- Você pode usar uma sub-lista para informar o conform para executar *até* que um formatador seja encontrado.
        -- javascript = { { "prettierd", "prettier" } },
      },
      -- Linters
      linters_by_ft = {
        python = {
	  "flake8",
	  args = { "--max-line-length", "88", "--ignore", "E203,W503" }
        }
      }
    },
  }
