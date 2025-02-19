-- [[ Setting options ]]
-- See `:help vim.opt`

-- NOTE: Você pode alterar essas opções como desejar!
--  Para mais opções, você pode ver `:help option-list`

-- Set highlight on search, mas limpe ao pressionar <Esc> no modo normal
vim.opt.hlsearch = true

-- Numera as linhas
vim.opt.number = true
-- Ativa linhas relativas
vim.opt.relativenumber = true

-- Ative o modo mouse, pode ser útil para redimensionar divisões, por exemplo!
vim.opt.mouse = 'a'

-- Não mostre o modo, pois ele já está na linha de status
vim.opt.showmode = false

-- Sincronize a área de transferência entre o sistema operacional e o Neovim.
--  Remova esta opção se desejar que a área de transferência do sistema operacional permaneça independente.
--  See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'

-- Habilita quebra de indentação
vim.opt.breakindent = true

-- Save o histórico de undo
vim.opt.undofile = true

-- Pesquisa sem distinção entre maiúsculas e minúsculas, A MENOS que \C ou uma ou mais letras maiúsculas no termo de pesquisa
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Mantém signcolumn ativado por padrão
vim.opt.signcolumn = 'yes'

-- Diminuir o tempo de atualização
vim.opt.updatetime = 250

-- Diminuir o tempo de espera da sequência mapeada
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure como novos splits devem ser abertos
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Define como o neovim exibirá determinados caracteres de espaço em branco no editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Visualize as substituições ao vivo, enquanto você digita!
vim.opt.inccommand = 'split'

-- Mostre em qual linha seu cursor está
vim.opt.cursorline = true

-- Número mínimo de linhas da tela a serem mantidas acima e abaixo do cursor.
vim.opt.scrolloff = 10
