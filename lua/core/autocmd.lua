--[[ Basic Autocommands
  O que são? São comandos que são executados automaticamente, ou melhor, disparados quando acontecer algum evento. 
  - See `:help lua-guide-autocommands`
 ]]

--[[  ########## Highlight para yank ################
  Este código Lua cria um autocomando no Neovim que destaca o texto copiado (yank) assim que ele é copiado. 
 - See `:help vim.hl.on_yank()`
 
 
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
    vim.hl.on_yank()
  end,
})


-- Garante que o Neovim reconheça arquivos .svelte
vim.filetype.add({
  extension = {
    svelte = "svelte",
  },
})

-- Regra para Web (HTML, CSS, JS, TS, React e JSON)
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "html",
    "css",
    "scss",
    "javascript",
    "typescript",
    "javascriptreact",
    "typescriptreact",
    "json",
    "svelte",
  },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.expandtab = true
  end,
})

-- Regra para Python (4 espaços obrigatoriamente)
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "python" },
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.expandtab = true
  end,
})

-- Regra para Go (Tabs reais)
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "go" },
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.expandtab = false -- Usa TABS reais
  end,
})
