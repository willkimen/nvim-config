-- [[ Setting options ]]
-- See `:help vim.o`

-- NOTE: Você pode alterar essas opções como desejar!
--  Para mais opções, você pode ver `:help oion-list`

-- Numera as linhas
vim.o.number = true

-- Ative o modo mouse, pode ser útil para redimensionar divisões, por exemplo!
vim.o.mouse = 'a'

-- Não mostre o modo, pois ele já está na linha de status
vim.o.showmode = false

-- Sincronize a área de transferência entre o sistema operacional e o Neovim.
--  Remova esta opção se desejar que a área de transferência do sistema operacional permaneça independente.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- Habilita quebra de indentação
vim.o.breakindent = true

-- Save o histórico de undo
vim.o.undofile = true

-- Pesquisa sem distinção entre maiúsculas e minúsculas, A MENOS que \C ou uma ou mais letras maiúsculas no termo de pesquisa
vim.o.ignorecase = true
vim.o.smartcase = true

-- Mantém signcolumn ativado por padrão
vim.o.signcolumn = 'yes'

-- Diminuir o tempo de atualização
vim.o.updatetime = 250

-- Diminuir o tempo de espera da sequência mapeada
-- Displays which-key popup sooner
vim.o.timeoutlen = 300

-- Configure como novos splits devem ser abertos
vim.o.splitright = true
vim.o.splitbelow = true

-- Define como o neovim exibirá determinados caracteres de espaço em branco no editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.o.list = true
--  Notice listchars is set using `vim.opt` instead of `vim.o`.
--  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Visualize as substituições ao vivo, enquanto você digita!
vim.o.inccommand = 'split'

-- Mostre em qual linha seu cursor está
vim.o.cursorline = true

-- Número mínimo de linhas da tela a serem mantidas acima e abaixo do cursor.
vim.o.scrolloff = 10

-- Ativa a opção 'confirm' no Neovim
-- Quando estiver editando um arquivo e tentar realizar uma operação que normalmente falharia por haver alterações não salvas
-- (como sair com :q, abrir outro arquivo, etc), o Neovim exibirá uma janela perguntando se você deseja salvar as alterações.
-- Isso evita perda de trabalho e torna a experiência mais interativa, semelhante a editores gráficos.
-- Veja também :help 'confirm' para mais detalhes.
vim.o.confirm = true

-- ####### Minhas opcoes que nao estao no oficial ######
-- Set highlight on search, mas limpe ao pressionar <Esc> no modo normal
vim.o.hlsearch = true

-- Ativa linhas relativas
vim.o.relativenumber = true
