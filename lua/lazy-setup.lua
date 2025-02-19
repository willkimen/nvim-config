--[[ ##### Configuração do lazy.nvim no Neovim #####
   Este código configura o lazy.nvim no Neovim, verificando se o repositório do plugin existe no sistema de arquivos local 
   e clonando-o se não existir, e então o adiciona ao runtime path do Neovim.
   O lazy.nvim é um plugin de gerenciamento de plugins para o Neovim. Ele oferece uma maneira eficiente e moderna de gerenciar 
   e carregar  plugins em seu ambiente Neovim.
   
   
   - See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim  para mais informações
 ]]

-- Define o caminho para onde o plugin lazy.nvim será armazenado
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
-- Verifica se o diretório do plugin existe. Se não existir, clona o repositório do GitHub
if not vim.loop.fs_stat(lazypath) then
  -- URL do repositório do plugin lazy.nvim
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  -- Clona o repositório do plugin usando o comando git
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
-- Adiciona o caminho do plugin ao runtime path do Neovim para que ele seja carregado
vim.opt.rtp:prepend(lazypath)
