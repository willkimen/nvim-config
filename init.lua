-- Faz cache dos módulos, acelerando a inicialização
vim.loader.enable()

require("core.global")
require("core.options")
require("core.keymaps")
require("core.autocmd")
require("core.diagnostic")

require("core.packages")

require("plugins")
