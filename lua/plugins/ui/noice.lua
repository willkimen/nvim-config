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

    -- Configura a apresentação da linha de comando e das buscas.
    cmdline = {
        format = {
            -- Exibe a busca para frente (/) em uma janela flutuante centralizada.
            search_down = {
                view = "cmdline_popup",
            },

            -- Exibe a busca para trás (?) em uma janela flutuante centralizada.
            search_up = {
                view = "cmdline_popup",
            },
        },
    },

    -- Personaliza a aparência e o posicionamento da janela flutuante.
    views = {
        cmdline_popup = {
            position = {
                -- Posiciona a janela verticalmente no centro do editor.
                row = "50%",

                -- Posiciona a janela horizontalmente no centro do editor.
                col = "50%",
            },
            size = {
                -- Define a largura da janela em 60 colunas.
                width = 60,

                -- Ajusta automaticamente a altura conforme o conteúdo.
                height = "auto",
            },
            border = {
                -- Adiciona bordas arredondadas à janela flutuante.
                style = "rounded",
            },
        },
    },

    presets = {
        -- Desativa o posicionamento da busca (/ e ?) na parte inferior,
        -- permitindo que ela utilize a janela flutuante configurada.
        bottom_search = false,

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
