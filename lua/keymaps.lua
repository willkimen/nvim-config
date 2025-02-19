-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`
--  See `:help wincmd` para obter uma lista de todos os comandos da janela

-- Pressionar Esc no modo normal limpa o destaque da pesquisa.
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Atalhos de diagnóstico
-- [d -> Vai para a mensagem de diagnóstico anterior.
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
-- ]d -> Vai para a próxima mensagem de diagnóstico.
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
-- Mostra mensagens de erro de diagnóstico em um popup.
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
-- Abre a lista de quickfix com mensagens de diagnóstico.
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Saia do modo terminal no terminal integrado com um atalho que é um pouco mais fácil para as pessoas descobrirem.
-- Caso contrário, você normalmente precisa pressionar <C-\><C-n>, o que
-- não é o que alguém adivinharia sem um pouco mais de experiência.

-- NOTE: Isso não funcionará em todos os emuladores de terminal/tmux/etc. Experimente seu próprio mapeamento
-- ou apenas use <C-\><C-n> para sair do modo terminal

--Pressionar Esc duas vezes no modo terminal muda para o modo normal.
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Desativa as teclas de seta no modo normal
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Atalhos de teclado para facilitar a navegação dividida.
--  Use CTRL+<hjkl> para alternar entre janelas
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' }) -- ctrl h
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' }) -- ctrl l
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' }) -- ctrl j
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' }) -- ctrl k

-- [[ ----------------  Meus atalhos ------------------------ ]]

-- O caractere ; pode ser usado agora para acessar modo command.
vim.keymap.set('n', ';', ':', { desc = 'CMD enter command mode' })

-- Os caracteres j+k para sair do modo insert para modo normal.
vim.keymap.set('i', 'jk', '<ESC>')

-- Agora ctrl z está desativado, para não sair da sessão do neovim sem querer.
vim.keymap.set('n', '<C-z>', '<Nop>', { noremap = true, silent = true })

-- Navegar para a próxima aba/tab usando a tecla Tab
vim.api.nvim_set_keymap('n', '<Tab>', ':tabnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Tab>', ':tabprevious<CR>', { noremap = true, silent = true })

-- Salvar o buffer atual com Ctrl+s
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-s>', '<C-o>:w<CR>', { noremap = true, silent = true })

-- [[ Movendo linhas ]]
-- Mover linha para cima
vim.api.nvim_set_keymap('n', '<C-k>', ':m .-2<CR>==', { noremap = true, silent = true })
-- Mover linha para baixo
vim.api.nvim_set_keymap('n', '<C-j>', ':m .+1<CR>==', { noremap = true, silent = true })
-- Para modo visual
vim.api.nvim_set_keymap('v', '<C-k>', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-j>', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
