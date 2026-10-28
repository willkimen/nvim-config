-- Melhora a interface de comandos, mensagens e notificações do Neovim.
-- Permite exibir os comandos em uma caixa flutuante, em vez de usar
-- sempre a linha inferior do editor.

require("noice").setup({
    lsp = {
        -- Melhora a exibição da documentação fornecida pelo LSP,
        -- como explicações de funções, tipos e parâmetros.
        override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
        },
    },

    presets = {
        -- Mantém a busca com / e ? na parte inferior do editor,
        -- como no Neovim tradicional.
        bottom_search = true,

        -- Posiciona o campo de comando e as sugestões em conjunto,
        -- facilitando a escolha de comandos.
        command_palette = true,

        -- Exibe mensagens muito longas em uma janela separada,
        -- evitando que ocupem ou poluam a área de comandos.
        long_message_to_split = true,

        -- Desativado: não habilita a janela especial de entrada
        -- usada pelo plugin inc-rename.nvim.
        inc_rename = false,

        -- Desativado: não adiciona bordas às janelas de documentação
        -- e ajuda do LSP.
        lsp_doc_border = false,
    },

    -- Usa a interface de notificações do Noice, integrando-a
    -- ao plugin nvim-notify quando disponível.
    notify = {
        enabled = true,
    },

    -- Melhora a apresentação das mensagens exibidas pelo Neovim,
    -- incluindo mensagens relacionadas a comandos.
    messages = {
        enabled = true,
    },
})
