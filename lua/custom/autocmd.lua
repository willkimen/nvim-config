-- [[ Basic Autocommands ]]

-- São comandos que são executados automaticamente, ou melhor, disparados quando acontecer algum evento. 

--  See `:help lua-guide-autocommands`
--  See `:help vim.highlight.on_yank()`

-- Destaca o texto que você copiou (yank). Experimente com `yap` no modo normal

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
