-- Autoformat

require('conform').setup {
  notify_on_error = false,
  format_on_save = function(bufnr)
    -- Para configurar a auto formatação quando salvar
    -- o buffer, faça aqui. Mas não esqueça de configura
    -- abaixo, o formatador em formatters_by_ft.
    local enabled_filetypes = {
      -- lua = true,
      -- python = true,
      rust = true,
    }
    if enabled_filetypes[vim.bo[bufnr].filetype] then
      return { timeout_ms = 500 }
    else
      return nil
    end
  end,
  default_format_opts = {
    lsp_format = 'fallback', -- Use external formatters if configured below, otherwise use LSP formatting. Set to `false` to disable LSP formatting entirely.
  },
  -- Para especificar os formatatores, faça aqui, mas
  -- não esqueça de baixar e instalar manualmente.
  formatters_by_ft = {
    rust = { 'rustfmt' },
    -- Conform can also run multiple formatters sequentially
    -- python = { "isort", "black" },
    --
    -- You can use 'stop_after_first' to run the first available formatter from the list
    -- javascript = { "prettierd", "prettier", stop_after_first = true },
  },
}

vim.keymap.set({ 'n', 'v' }, '<leader>f', function() require('conform').format { async = true } end, { desc = '[F]ormat buffer' })
