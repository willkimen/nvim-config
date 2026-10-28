-- Exibe diagnósticos, símbolos e resultados do LSP
-- em janelas flutuantes navegáveis.

require("trouble").setup({
    -- Desativa a pré-visualização automática dos itens selecionados,
    -- evitando a abertura de janelas flutuantes adicionais.
    auto_preview = false,

    -- Define os atalhos disponíveis dentro das janelas do Trouble.
    keys = {
        -- Enter: navega até o item selecionado e fecha o Trouble,
        -- deixando o foco no arquivo de destino.
        ["<cr>"] = "jump_close",

        -- q: fecha a janela atual do Trouble.
        q = "close",

        -- Esc: cancela a ação atual, como a pré-visualização.
        ["<esc>"] = "cancel",
    },
})

-- Abre o Trouble em uma janela flutuante.
-- `mode` define o tipo de conteúdo exibido.
-- `extra` permite passar opções adicionais, como filtros.
local function toggle_float(mode, extra)
    local opts = {
        mode = mode,

        -- Solicita que a janela do Trouble receba o foco.
        focus = true,

        -- Define a janela como flutuante (popup),
        -- em vez de uma divisão lateral ou inferior.
        win = {
            type = "float",
        },
    }

    -- Incorpora opções adicionais à configuração.
    -- Por exemplo, filtrar os diagnósticos pelo buffer atual.
    if extra then
        for key, value in pairs(extra) do
            opts[key] = value
        end
    end

    -- Abre o Trouble ou fecha sua janela, caso já esteja aberta.
    require("trouble").toggle(opts)
end

-- <leader>xx: exibe diagnósticos gerais, como erros e avisos
-- reportados pelo LSP e por ferramentas de diagnóstico.
vim.keymap.set("n", "<leader>xx", function()
    toggle_float("diagnostics")
end, {
    desc = "Diagnósticos (Popup)",
})

-- <leader>xX: exibe somente os diagnósticos do buffer atual.
vim.keymap.set("n", "<leader>xX", function()
    toggle_float("diagnostics", {
        filter = { buf = 0 },
    })
end, {
    desc = "Diagnósticos do buffer (Popup)",
})

-- <leader>cs: exibe os símbolos do arquivo atual,
-- como classes, funções e métodos reconhecidos pelo LSP.
vim.keymap.set("n", "<leader>cs", function()
    toggle_float("symbols")
end, {
    desc = "Símbolos do arquivo (Popup)",
})

-- <leader>cl: exibe informações de navegação do LSP,
-- como definições, referências e implementações disponíveis.
vim.keymap.set("n", "<leader>cl", function()
    toggle_float("lsp")
end, {
    desc = "Navegação LSP (Popup)",
})

-- <leader>xL: exibe a Location List, lista de localizações
-- associada à janela atual do Neovim.
vim.keymap.set("n", "<leader>xL", function()
    toggle_float("loclist")
end, {
    desc = "Lista de localização (Popup)",
})

-- <leader>xQ: exibe a Quickfix List, usada para reunir
-- resultados de buscas, erros e outros itens navegáveis.
vim.keymap.set("n", "<leader>xQ", function()
    toggle_float("qflist")
end, {
    desc = "Lista Quickfix (Popup)",
})
