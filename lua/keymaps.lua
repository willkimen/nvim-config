-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`
--  See `:help wincmd` para obter uma lista de todos os comandos da janela

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Saia do modo terminal no terminal integrado com um atalho que é um pouco mais fácil para as pessoas descobrirem. 
-- Caso contrário, você normalmente precisa pressionar <C-\><C-n>, o que
-- não é o que alguém adivinharia sem um pouco mais de experiência.

-- NOTE: Isso não funcionará em todos os emuladores de terminal/tmux/etc. Experimente seu próprio mapeamento
-- ou apenas use <C-\><C-n> para sair do modo terminal
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Desativa as teclas de seta no modo normal
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Atalhos de teclado para facilitar a navegação dividida.
--  Use CTRL+<hjkl> para alternar entre janelas

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- O caractere ; pode ser usado agora para acessar modo command.
vim.keymap.set('n', ';', ':', { desc = 'CMD enter command mode' })
-- Os caracteres j+k para sair do modo insert para modo normal.
vim.keymap.set('i', 'jk', '<ESC>')
-- Agora ctrl z está desativado, para não sair da sessão do neovim sem querer.
vim.keymap.set('n', '<C-z>', '<Nop>', { noremap = true, silent = true })

