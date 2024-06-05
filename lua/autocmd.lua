--[[ Basic Autocommands
  O que são? São comandos que são executados automaticamente, ou melhor, disparados quando acontecer algum evento. 
  - See `:help lua-guide-autocommands`
 ]]



--[[  ########## Highlight para yank ################
  Este código Lua cria um autocomando no Neovim que destaca o texto copiado (yank) assim que ele é copiado. 
 - See `:help vim.highlight.on_yank()`
 
 
]]
--Cria um autocomando que é disparado após o texto ser copiado (evento 'TextYankPost').
vim.api.nvim_create_autocmd('TextYankPost', {
  -- Descrição do autocomando para referência
  desc = 'Highlight when yanking (copying) text',
  -- Associa o autocomando ao grupo 'kickstart-highlight-yank'
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  -- Define a função de callback que será executada quando o evento 'TextYankPost' ocorrer
  callback = function()
  -- Chama a função que destaca o texto copiado
    vim.highlight.on_yank()
  end,
})
