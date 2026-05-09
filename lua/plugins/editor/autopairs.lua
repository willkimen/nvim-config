-- autopairs
-- https://github.com/windwp/nvim-autopairs

require("nvim-autopairs").setup({})

-- Se você quiser adicionar automaticamente `(` após selecionar uma função ou método
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
